class LineItem < ApplicationRecord
  belongs_to :phone
  belongs_to :cart
  belongs_to :order, optional: true
  belongs_to :phone, optional: true

  def total_price
    phone.price * quantity
  end
end
