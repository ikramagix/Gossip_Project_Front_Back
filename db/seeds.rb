# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.where.not(id: 207).destroy_all
City.destroy_all
Gossip.destroy_all

Faker::Config.locale = 'fr'

5.times do 
    City.create(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end

5.times do 
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Hacker.say_something_smart,
        age: Faker::Number.between(from: 18, to: 99),
        city: City.all.sample
    )
end

5.times do 
    Gossip.create(
        title: Faker::GreekPhilosophers.name,
        content: Faker::GreekPhilosophers.quote,
        user: User.all.sample
    )
end