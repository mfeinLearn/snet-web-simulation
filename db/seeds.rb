# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(name: "Malcome", password: "password", data: 100)
# Robo Pikachu
  Service.create!(
    name: "Electrician",
    description: "Electrical wiring of buildings, transmission lines, stationary machines, and related equipment.",
    price: rand(1...5)
  )
  Service.create!(
    name: "Electrical Engineer",
    description: "Design and application of equipment, devices and systems which use electricity, electronics, and electromagnetism.",
    price: rand(1...5)
  )
  # Robo Charmander
  Service.create!(
    name: "Police Officer",
    description: "Enforce laws, investigate crimes, and make arrests",
    price: rand(1...5)
  )
  Service.create!(
    name: "Mercenary",
    description: "Hired professional soldier who fights for any state or nation without regard to political interests or issues.",
    price: rand(1...5)
  )

  # Robo Mewtwo
  Service.create!(
    name: "Psychologist",
    description: "Mind and behavior",
    price: rand(1...5)
  )
  Service.create!(
    name: "Magician",
    description: "Entertainer who performs magic tricks,",
    price: rand(1...5)
  )
  # Robo Squirtle
  Service.create!(
    name: "Gardener",
    description: "Maintains plants, flowers and trees",
    price: rand(1...5)
  )
  Service.create!(
    name: "Firefighter",
    description: "Responding to fires, accidents and other incidents where risks are posed to life and property",
    price: rand(1...5)
  )

  # Robo Jigglypuff
  Service.create!(
    name: "Singer",
    description:  "Read and interpret musical compositions and apply their voice and style to create a song.",
    price: rand(1...5)
  )
  Service.create!(
    name: "Actress",
    description: "Acts for pay",
    price: rand(1...5)
  )

  Ai.create!(
    name: "Robo Pikachu",
    user_id: 1,
    description: "Mouse, Electric, Static",
    balance: rand(1...5)
  )
  Ai.create!(
    name: "Robo Charmander",
    user_id: 1,
    description: "Lizard, Fire, Blaze",
    balance: rand(1...5)
  )
  Ai.create!(
    name: "Robo Mewtwo",
    user_id: 1,
    description: "Mewtwo, Psychic, Pressure",
    balance: rand(1...5)
  )
  Ai.create!(
    name: "Robo Squirtle",
    user_id: 1,
    description: "Tiny Turtle, Water, Torrent",
    balance: rand(1...5)
  )
  Ai.create!(
    name: "Robo Jigglypuff",
    user_id: 1,
    description: "Balloon, Fairy, Cute Charm",
    balance: rand(1...5)
  )
    # Robo Pikachu and service 1 and 2
  Transaction.create!(
    status: true,
    service_id: 1,
    ai_id: 1
  )
  Transaction.create!(
    status: true,
    service_id: 2,
    ai_id: 1
  )
    # Robo Charmander and service 3 and 4
  Transaction.create!(
    status: true,
    service_id: 3,
    ai_id: 2
  )
  Transaction.create!(
    status: true,
    service_id: 4,
    ai_id: 2
  )
    # Robo Mewtwo and service 5 and 6
  Transaction.create!(
    status: true,
    service_id: 5,
    ai_id: 3
  )
  Transaction.create!(
    status: true,
    service_id: 6,
    ai_id: 3
  )

    # Robo Squirtle and service 7 and 8
  Transaction.create!(
    status: true,
    service_id: 7,
    ai_id: 4
  )
  Transaction.create!(
    status: true,
    service_id: 8,
    ai_id: 4
  )

    # Robo Jigglypuff and service 9 and 10
  Transaction.create!(
    status: true,
    service_id: 8,
    ai_id: 5
  )
  Transaction.create!(
    status: true,
    service_id: 10,
    ai_id: 5
  )
