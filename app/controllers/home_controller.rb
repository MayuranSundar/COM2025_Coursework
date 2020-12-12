class HomeController < ApplicationController
    # skip before action authorize allows the user to view the contents of the controller without logging in as an admin
    skip_before_action :authorize

    # Takes the user to the homepage
    def index
    end
    
    # Takes the user to the contact page
    def contact
    end
    
    # Action to posts the contact email
    def request_contact
        name = params[:name]
        email = params[:email]
        phone = params[:phone]
        message = params[:message]
        
        # Once the email is sent, returns the user to the same page
        redirect_to contact_path

        # if the email is empty flashes an appropriate error message 
        if email.blank?
            flash[:alert] = t('.no_email')
        # if all the fields are valid then the email is delivered now 
        else
            ContactMailer.contact_email(email, name, phone, message).deliver_now
            # Flash notice to tell the user, that the email is sent
            flash[:notice] = t('.email_sent')
        end
    end
  
end
  