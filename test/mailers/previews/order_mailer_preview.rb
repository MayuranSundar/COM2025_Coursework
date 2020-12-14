# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/received
  def received
    OrderMailer.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/dispatched
  def dispatched
    OrderMailer.dispatched
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/delivered
  def delivered
    OrderMailer.delivered
  end

end
