FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
