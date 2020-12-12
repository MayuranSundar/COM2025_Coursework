class Cart < ApplicationRecord
    # Defining the relationship between carts and line items
    # A cart can have many line items
    # When a cart is destroyed so does all the line items associated with it
    has_many :line_items, dependent: :destroy

    # Adds a phone to the table by finding the phone id 
    def add_phone(phone)
        current_item = line_items.find_by(phone_id: phone.id)
        # If the specific id already exists, increaese the quantity by one
        if current_item
          current_item.quantity += 1
        # else build a new one
        else
          current_item = line_items.build(phone_id: phone.id)
        end
        current_item
    end

    # Method to get the total price line items to display in the cart
    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end
