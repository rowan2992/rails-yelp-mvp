require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all restaurants..."

Restaurant.destroy_all

puts "Populating database with restaurants"

restaurants = []

25.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )

  puts "#{restaurant.name} was created"
  restaurants << restaurant
end

50.times do
  review = Review.create(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant: restaurants.sample
  )
  puts "a review for #{review.restaurant.name} was created with a rating of #{review.rating}"
end

puts "done"