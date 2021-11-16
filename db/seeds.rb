# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'seeding...'

Outfit.destroy_all
User.destroy_all

x = 0

10.times do
  x += 1
  puts "Creating user #{x} / 10"

  user = User.create(
    email: Faker::Internet.email,
    password: 'p@ssw0rd',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.between(from: '1970-01-01', to: '2014-09-25'),
    address: Faker::Address.full_address,
    dog_breed: Faker::Creature::Dog.breed
  )

  y = 1

  5.times do
    puts "Creating outfit #{y} / 5 for user #{x} / 10"
    y += 1

    outfit = Outfit.create!(
      name: Faker::Movies::HitchhikersGuideToTheGalaxy.specie,
      size: ['extra small', 'small', 'medium', 'large', 'extra large'].sample,
      price: (1..100).to_a.sample,
      max_loan_period: (1..10).to_a.sample,
      user_id: user.id
    )
    image_url = URI.open("https://source.unsplash.com/1600x900/?dog-clothes")
    outfit.photos.attach(io: image_url, filename: "#{outfit.name}.jpg")
  end
end

puts 'finished!'
