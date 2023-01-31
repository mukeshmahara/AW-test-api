class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attribute :token do |users, params|
    params[:token]
  end
  attribute :name do |users|
    users.full_name
  end
  attributes  :email, :country, :created_at, :updated_at
 
end
