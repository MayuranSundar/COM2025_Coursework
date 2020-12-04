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
      
        if email.blank?
            flash[:notice] = t('home.request_contact.no_email')
        else
            ContactMailer.contact_email(email, name, phone, message).deliver_now
            flash[:notice] = t('home.request_contact.email_sent')
        end
      
        redirect_to contact_path
    end
  
end
  