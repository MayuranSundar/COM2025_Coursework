require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  fixtures :phones

  test "Phone attributes must not be empty" do
    phone = Phone.new
    assert phone.invalid?
    assert phone.errors[:brand].any?
    assert phone.errors[:model].any?
    assert phone.errors[:size].any?
    assert phone.errors[:colour].any?
    assert phone.errors[:specifications].any?
    assert phone.errors[:image_url].any?
    assert phone.errors[:price].any?
  end

  test "Phone price must be positive" do
    phone = Phone.new(brand: "Apple", 
                       model: "iPhone", 
                       size: "128GB", 
                       colour: "Blue", 
                       specifications: "iOS 14", 
                       image_url:"zzz.jpg")
    phone.price = -1
    assert phone.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ],
    phone.errors[ :price ]
    phone.price = 0
    assert phone.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ],
    phone.errors[ :price ]
    phone.price = 1
    assert phone.valid?
  end

  def new_phone(image_url)
    phone = Phone.new(brand: "Apple", 
                       model: "iPhone", 
                       size: "128GB", 
                       colour: "Blue", 
                       specifications: "iOS 14", 
                       image_url: image_url,
                       price: 1)
  end

  test "image url validation" do
    ok = %w{ img.png img.gif img.jpg IMG.Jpg IMG.JPG }
    bad = %w{ img.doc img.gif/more img.gif.more }
    
    ok.each do |image_url|
    assert new_phone(image_url).valid?,
    "#{ image_url } should not be invalid"
    end

    bad.each do |image_url|
    assert new_phone(image_url).invalid?,
    "#{ image_url } should not be valid"
    end

  end
  
end
