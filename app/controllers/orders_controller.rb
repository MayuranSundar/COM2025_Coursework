class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # Includes the current cart to get the cart informations
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  # Ensures that the cart isnt empty when a order is created
  before_action :ensure_cart_isnt_empty, only: :new
  # Authorises user to create a new order without logging in
  skip_before_action :authorize, only: [:new, :create]
  
  # Index action lists all the orders for the admin to see
  def index
    @orders = Order.all
  end

  # Show controller that displays individual order information
  def show
  end

  # Action to create an object of an order
  def new
    @order = Order.new
  end

  # Action to create a new order which adds a line items from cart
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      # if order is successfully saved, cart is destroyed
      if @order.save
        Cart.destroy(session[:cart_id])
        # Session is set to nil for the next order
        session[:cart_id] = nil

        # Tells the OrderMailer to deliver the order confirmation email 
        OrderMailer.received(@order).deliver_now
        # Tells the OrderMailer to deliver the dispatched email later
        # This can be changed to hours or days but for the purpose of this app it will be 5 mins
        OrderMailer.dispatched(@order).deliver_later(wait: 5.minutes)
        # Tells the OrderMailer to deliver the delivered email later
        # This can be changed to 1 week from order date using (wait: 1.weeks.from_now) to match the order and dispatched email
        # but for the purpose of this app it will be 10 mins
        OrderMailer.delivered(@order).deliver_later(wait: 10.minutes)


        # Notice is shown to let the user know the order is placed
        format.html { redirect_to store_index_url, notice: 'Your order has been placed.' }
        format.json { render :show, status: :created, location: @order }
      # Else shows the issues while making the order
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to update the order
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action  to destroy the order by admin
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was destroyed.' }
      format.json { head :no_content }
    end
  end

  # Private methods to set the order and white list the parameters
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
  
  # Private methods to make sure the cart isn't empty while ordering
  private
      def ensure_cart_isnt_empty
        if @cart.line_items.empty?
          redirect_to store_index_url, notice: 'Your cart is empty'
        end
      end  
end
