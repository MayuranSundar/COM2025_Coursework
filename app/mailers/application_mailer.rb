class ApplicationMailer < ActionMailer::Base
  default to: 'dogswatch0@gmail.com'
  default from: 'dogswatch0@gmail.com'
  default subject: 'Pro Phones Customer Query'
  
  layout 'mailer'
end
