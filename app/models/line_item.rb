class LineItem < ApplicationRecord
  # Defines the relationship between line items and phone, cart, order, and phone
  belongs_to :phone
  belongs_to :cart
  belongs_to :order, optional: true
  belongs_to :phone, optional: true

  # Method to get the total price of one phone by multiplying the phone price by its quantity
  def total_price
    phone.price * quantity
  end
end
