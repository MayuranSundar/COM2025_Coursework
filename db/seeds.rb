LineItem.delete_all
Order.delete_all
Phone.delete_all

Phone.create!(
    brand: 'Apple',
    model: 'iPhone 12 Pro',
    size: '128GB',
    colour: 'Midnight Blue',
    specifications: 'iOS 14',
    image_url: 'phones/iphone12pro.jpg',
    price: 999.00)     

Phone.create!(
    brand: 'Apple',
    model: 'iPhone 12 Pro Max',
    size: '256GB',
    colour: 'Gold',
    specifications: 'iOS 14',
    image_url: 'phones/iphone12promax.jpg',
    price: 1249.00)
    
Phone.create!(
    brand: 'Apple',
    model: 'iPhone 12',
    size: '64GB',
    colour: 'Red',
    specifications: 'iOS 14',
    image_url: 'phones/iphone12.jpg',
    price: 799.00) 

Phone.create!(
    brand: 'Samsung',
    model: 'Galaxy S20 Ultra',
    size: '128GB',
    colour: 'Black',
    specifications: 'Android 10',
    image_url: 'phones/s20ultra.jpg',
    price: 1249.00) 
    
Phone.create!(
    brand: 'Samsung',
    model: 'Galaxy S20 FE',
    size: '128GB',
    colour: 'Cloud Navy',
    specifications: 'Android 10',
    image_url: 'phones/s20fe.jpg',
    price: 599.99)     

Phone.create!(
    brand: 'Samsung',
    model: 'Galaxy S20',
    size: '128GB',
    colour: 'Blue',
    specifications: 'Android 10',
    image_url: 'phones/s20.jpg',
    price: 799.99) 
    
Phone.create!(
    brand: 'Samsung',
    model: 'Galaxy Fold2',
    size: '256GB',
    colour: 'Mystic Bronze',
    specifications: 'Android 10',
    image_url: 'phones/fold2.jpg',
    price: 1799.99) 

Phone.create!(
    brand: 'Samsung',
    model: 'Galaxy Z Flip',
    size: '256GB',
    colour: 'Mystic Grey',
    specifications: 'Android 10',
    image_url: 'phones/zflip.jpg',
    price: 1399.99) 

Phone.create!(
    brand: 'Google',
    model: 'Pixel 4 a',
    size: '128GB',
    colour: 'Just Black',
    specifications: 'Android 10',
    image_url: 'phones/pixel4a.jpg',
    price: 349.00) 

Phone.create!(
    brand: 'Google',
    model: 'Pixel 5',
    size: '128GB',
    colour: 'Just Black',
    specifications: 'Android 10',
    image_url: 'phones/pixel5.jpg',
    price: 599.00) 

Phone.create!(
    brand: 'Sony',
    model: 'Xperia 1II',
    size: '256GB',
    colour: 'Black',
    specifications: 'Android 10',
    image_url: 'phones/xperia.jpg',
    price: 1099.99) 

User.delete_all
User.create(
    name: 'admin',
    password: 'mypass'
)