# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

### Create users
10.times do |_user|
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

### Create lists for users
first_user = User.first

2.times do |_list|
  band_name = Faker::Music::RockBand.name
  list = List.create(
    title: "#{band_name}'s Top Songs",
    description: "My biased opinion... the top songs of #{band_name} in no particular order",
  )
  first_user.lists << list
end

second_user = User.second

2.times do |n|
  list = List.create(
    title: "#{n+1} List",
    description: "A generic list of things",
  )

  second_user.lists << list
end
