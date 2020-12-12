class ApplicationController < ActionController::Base
  # skip before action authorize allows the user to view the contents of the controller without logging in as an admin  
  before_action :authorize
  
    protected
      # Authorize method for the admin to log in before they proceed to the admin index page
      def authorize
        unless User.find_by(id: session[:user_id])
          redirect_to login_url, notice: "You need to log in before you can proceed"
        end
      end
end