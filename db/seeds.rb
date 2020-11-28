# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Phone.delete_all

Phone.create!(
    brand: 'Apple',
    model: 'iPhone 12 Pro',
    size: '128GB',
    colour: 'Midnight Blue',
    specifications: 'iOS 14',
    image_url: 'iphone12pro.jpg',
    price: 999.00)     

Phone.create!(
    brand: 'Apple',
    model: 'iPhone 12 Pro Max',
    size: '256GB',
    colour: 'Gold',
    specifications: 'iOS 14',
    image_url: 'iphone12promax.jpg',
    price: 1249.00) 