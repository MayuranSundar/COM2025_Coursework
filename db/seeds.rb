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

User.create(
    name: 'admin',
    password: 'mypass'
)