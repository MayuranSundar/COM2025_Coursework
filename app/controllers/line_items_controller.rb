class LineItemsController < ApplicationController
  # Includes the current cart to link to the product
  include CurrentCart
  before_action :set_cart, only: [:create]
  # Authorise users to access only the create action of line items
  skip_before_action :authorize, only: :create
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # Index action that displays all the line items 
  def index
    @line_items = LineItem.all
  end

  # Action to create an object of a line item
  def new
    @line_item = LineItem.new
  end

  # Action to create new line item
  def create
    phone = Phone.find(params[:phone_id])
    @line_item = @cart.add_phone(phone)

    respond_to do |format|
      # If the line item is created, redirects the user the store homepage
      if @line_item.save
        format.html { redirect_to store_index_url }
        format.js   { @current_item = @line_item}
        format.json { render :show, status: :created, location: @line_item }
      # Else show the error of creating line item
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update action for line items
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to destroy the line itema and a notice that lets the user know it is destroyed
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was destroyed.' }
      format.json { head :no_content }
    end
  end

  # Private methods to set the line items and to link the line items to phone id
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:phone_id)
    end
end
