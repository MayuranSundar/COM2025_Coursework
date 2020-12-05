class OrderMailer < ApplicationMailer
  default from: 'Pro Phones <ProPhonesLtd@gmail.com>'

  def received(order)
    @order = order

    mail to: order.email, subject: 'Your Pro Phones Order Confirmation'
  end

  def dispatched(order)
    @order = order
    mail to: order.email, subject: 'Your Pro Phones Order Has Been Dispatched'
  end
end
