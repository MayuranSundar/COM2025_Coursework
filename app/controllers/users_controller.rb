class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Index action lists all the admins
  def index
    @users = User.order(:name)
  end

  # Action to create an object of an user
  def new
    @user = User.new
  end

  # Action to edit the user information 
  def edit
  end

  # Action to create a user and notices once successful 
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User #{@user.name} was created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Action to update the user details 
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User #{@user.name} was updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroy action to delete a user
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url,
        notice: "User #{@user.name} was deleted" }
      format.json { head :no_content }
    end
  end

  # Rescue form to stop the last user from deleting himself
  rescue_from 'User::Error' do |exception|
    redirect_to users_url, notice: exception.message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Only allows white listed parametesr 
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
