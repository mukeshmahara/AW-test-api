FactoryBot.define do
  factory :project do
    title { Faker::App.name }
    description { Faker::Lorem.paragraph }
    project_type { %i[in_house external international].sample }
    location { Faker::Address.country }
    # thumbnail {[ Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/dell_screen.jpg", 'image/png') ]}
    
    user_id {User.ids.sample}
  end
end