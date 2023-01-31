class ContentSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attribute :project_id do |content|
    content.project_id
  end
  attribute :project_owner_name do |content|
    content.user.full_name
  end
  attributes :title, :body, :created_at, :updated_at
end
