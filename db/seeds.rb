# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(name: "Malcome", password: "password", data: 100)

5.times do
  Service.create!(
    name: Faker::TvShows::FamilyGuy.character,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    price: rand(1...5)
  )
end
5.times do
  Ai.create!(
    name: Faker::Movies::HarryPotter.character,
    user_id: 1,
    description: Faker::Movies::StarWars.wookiee_sentence,
    balance: rand(1...5)
  )
end
5.times do
  Transaction.create!(
    status: nil,
    service_id: 1,
    ai_id: 1
  )
end
