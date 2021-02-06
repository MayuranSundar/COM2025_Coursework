class AdminController < ApplicationController
  # Takes the admin to the admin homepage
  def index
    # Variable to display to the admin, the total number of orders at the momemnt
    @total_orders = Order.count
  end
end
