FactoryBot.define do

  factory :content do
    title {Faker::Drone.name}
    body {Faker::Lorem.paragraph }
    user_id {User.ids.sample}
    project_id {Project.ids.sample}
  end

end