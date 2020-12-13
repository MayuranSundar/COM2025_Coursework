class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # Gives a normal user access to only create, update and destroy actions of the cart
  skip_before_action :authorize, only: [:create, :update, :destroy]

  # The index page of carts which shows all the available carts
  def index
    @carts = Cart.all
  end

  # Show page for individual carts
  def show
  end

  # Action to create an object of a cart
  def new
    @cart = Cart.new
  end

  # Create action which creates a new cart when the user adds a product to the cart
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        # Notice to let the user know the cart was created
        format.html { redirect_to @cart, notice: 'Cart was created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        # Error message to display when the cart is not created
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to update the cart
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to destroy the cart as an admin
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to store_index_url,
        notice: 'Your cart is empty' }
      format.json { head :no_content }
    end
  end

  
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Method to allow white listed parameters 
    def cart_params
      params.fetch(:cart, {})
    end

    # Error Message when trying to access invalid cart
    def invalid_cart
      logger.error "Cart #{params[:id]} doesn't exist"
      redirect_to store_index_url, notice: 'Cart is invalid'
    end
end
