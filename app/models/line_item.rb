class LineItem < ApplicationRecord
  belongs_to :phone
  belongs_to :cart

  def total_price
    phone.price * quantity
  end
end
