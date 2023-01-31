class Project < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :title, presence: true

  belongs_to :user
  has_many :contents
  has_one_attached :thumbnail

  enum project_type: { in_house: 0, external: 1, international: 2 }

  def thumbnail_url 
    rails_blob_path(self.thumbnail, disposition: "attachment", only_path: true) if self.thumbnail.attached?
  end
end
