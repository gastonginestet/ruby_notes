FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    password { Faker::Internet.password(min_length:3) }
    password_confirmation { password }
    email { Faker::Internet.email }
  end
end
