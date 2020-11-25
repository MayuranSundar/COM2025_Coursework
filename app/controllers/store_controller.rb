class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @phones = Phone.order(:brand)
  end
end
