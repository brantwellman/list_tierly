FactoryBot.define do
  factory :list do
    title { "#{Faker::Music::RockBand.name}'s Top Songs" }
    description { "MyText" }
    user
  end
end
