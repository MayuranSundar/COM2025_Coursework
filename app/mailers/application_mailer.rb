class ApplicationMailer < ActionMailer::Base
  default to: 'ProPhonesLtd@gmail.com'
  default from: 'ProPhonesLtd@gmail.com'
  default subject: 'Pro Phones Customer Query'
  
  layout 'mailer'
end
