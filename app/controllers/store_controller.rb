class StoreController < ApplicationController
  def index
    @phones = Phone.order(:brand)
  end
end
