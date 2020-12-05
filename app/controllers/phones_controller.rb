class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  def index
    @phones = Phone.all
  end

  def show
  end

  def new
    @phone = Phone.new
  end

  def edit
  end

  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to @phone, notice: 'Phone was created.' }
        format.json { render :show, status: :created, location: @phone }
      else
        puts @phone.errors.full_messages
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: 'Phone was destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  private
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:brand, :model, :size, :colour, :specifications, :image_url, :price)
    end

  
end
