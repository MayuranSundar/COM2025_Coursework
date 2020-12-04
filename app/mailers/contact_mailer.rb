class ContactMailer < ApplicationMailer

    def contact_email(email, name, phone, message)
        @email = email
        @name = name
        @phone = phone
        @message = message

        mail cc: @email
    end

end
