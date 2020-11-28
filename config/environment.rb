# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# SMTP Settings for Gmail.
ProPhones::Application.configure do
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    user_name: "ProPhonesLtd",
    password: "Changeme123",
    enable_starttls_auto: true
    }
end