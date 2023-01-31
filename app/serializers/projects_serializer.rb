class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :title, :project_type, :location, :description

  attribute :owner_name do |project|
    project.user.full_name
  end
  
  attribute :thumbnail do |project|
    project.thumbnail_url
  end
  
end
