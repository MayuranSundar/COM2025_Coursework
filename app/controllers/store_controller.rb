class StoreController < ApplicationController
  # Includes the current cart for customer order
  include CurrentCart
  # Before action sets up a cart for the current user
  before_action :set_cart

  # Lets users who aren't an admin to access the controller and it's views
  skip_before_action :authorize
  
  # Index controller lists all the phones in the brand alphabatical order
  def index
    @phones = Phone.order(:brand)
  end
end
