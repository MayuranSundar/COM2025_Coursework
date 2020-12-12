class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  # Index action lists all the phones for the admin to see
  def index
    @phones = Phone.all
  end

  # Action to show individual phones information
  def show
  end

  # Action to create an object of a phone
  def new
    @phone = Phone.new
  end

  # Action to let the admin edit the phone
  def edit
  end

  # Action to create the phone using the valid parameters provided 
  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      # Notie the admin when it is successfuly created and then render the show page
      if @phone.save
        format.html { redirect_to @phone, notice: 'Phone was created.' }
        format.json { render :show, status: :created, location: @phone }
      # Notices the user about the errors occured while creating the phonw 
      else
        puts @phone.errors.full_messages
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to update the phone as an admin
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to @phone, notice: 'Phone was updated.' }
        format.json { render :show, status: :ok, location: @phone }
        @phones = Phone.all
        ActionCable.server.broadcast 'phones',
          html: render_to_string('store/index', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to destroy the phone as an admin
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: 'Phone was destroyed.' }
      format.json { head :no_content }
    end
  end

# Action to check to see if a request is stale
  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  # Private methods to set the phone and white list the parameters
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:brand, :model, :size, :colour, :specifications, :image_url, :price)
    end

  
end
