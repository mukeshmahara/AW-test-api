FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    password_digest {'cipher'}
    email {Faker::Internet.email}
    country {Faker::Address.country}
  end
end