# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all

10.times do 
    City.create(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end

10.times do 
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        age: Faker::Number.between(from: 18, to: 99),
        city: City.all.sample
    )
end

10.times do 
    Gossip.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(sentence_count: 2),
        user: User.all.sample
    )
end