class SessionsController < ApplicationController
  # Lets the user log in without being an admin
  skip_before_action :authorize

  # New action for the sessions controller
  def new
  end

  # Create action to let the user log in if the username password combination is correct
  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user name or password"
    end
  end

  # Action to let the user log out
  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "User logged out"
  end
end