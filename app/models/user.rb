class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :presence=> true
  validates :email, :presence => true, :uniqueness => true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  
  has_many :projects, dependent: :destroy
  has_many :contents

  def full_name
    [first_name, last_name].compact_blank.join(" ")
  end
end
