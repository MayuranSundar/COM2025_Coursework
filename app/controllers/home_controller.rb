class HomeController < ApplicationController
    skip_before_action :authorize

    def index
    end
  
    def contact
    end
    
    def request_contact
        name = params[:name]
        email = params[:email]
        phone = params[:phone]
        message = params[:message]
      
        redirect_to contact_path

        if email.blank?
            flash[:alert] = t('.no_email')
        else
            ContactMailer.contact_email(email, name, phone, message).deliver_now
            flash[:notice] = t('.email_sent')
        end
    end
  
end
  