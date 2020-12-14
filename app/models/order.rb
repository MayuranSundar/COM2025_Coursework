class Order < ApplicationRecord
    # Defining the relationship between orders and line items
    # An order can have many line items
    # When an order is destroyed so does all the line items associated with it
    has_many :line_items, dependent: :destroy

    # Enum of different pay types for the user to choose from 
    enum pay_type: {
        "Debit Card / Credit Card" => 0,
        "PayPal" => 1,
        "Gift Card" => 2
    }

    validates :name, :address, :email, presence: true
    validates :pay_type, inclusion: pay_types.keys

    # Method to add line item to cart
    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
            item.cart_id = nil
            line_items << item
        end
    end
end
