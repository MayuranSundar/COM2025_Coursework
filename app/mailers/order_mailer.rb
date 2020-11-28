class OrderMailer < ApplicationMailer
   # Default from message
  default from: 'Pro Phones <ProPhonesLtd@gmail.com>'
  # MAYBE ADD DEFAULT CC AND MSG

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Your ProPhones Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.dispatched.subject
  #
  def dispatched(order)
    @order = order
    mail to: order.email, subject: 'Your ProPhones Order Has Been Dispatched'
  end
end
