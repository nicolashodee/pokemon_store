# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
User.destroy_all

require 'faker'

18.times do
  pokemon = Faker::Games::Pokemon.name
  item = Item.create(
    title: pokemon,
    description: Faker::TvShows::Simpsons.quote,
    price: rand(100..1000),
    image_url: 'https://img.pokemondb.net/artwork/large/' + pokemon.downcase + '.jpg'
  )
end

admin = User.create(
  email: 'admin@pokemon-store.com',
  password: 'azerty',
  password_confirmation: 'azerty',
  is_admin: true,
  first_name: 'Admin',
  last_name: 'ADMIN',
  description: 'Je suis un admin',
  dob: '28/10/1994',
  address: 'Devant mon mac',
  postcode: '33000')