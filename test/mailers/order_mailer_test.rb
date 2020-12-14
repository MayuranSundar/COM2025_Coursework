require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Your Pro Phones Order Confirmation", mail.subject
    assert_equal ["test@test.com"], mail.to
    assert_equal ["ProPhonesLtd@gmail.com"], mail.from
    assert_match /Thanks for your order./, mail.body.encoded
  end

  test "dispatched" do
    mail = OrderMailer.dispatched(orders(:one))
    assert_equal "Your Pro Phones Order Has Been Dispatched", mail.subject
    assert_equal ["test@test.com"], mail.to
    assert_equal ["ProPhonesLtd@gmail.com"], mail.from
    assert_match "We thought you would like to know that your item(s) have been dispatched", mail.body.encoded
  end

  test "delivered" do
    mail = OrderMailer.delivered(orders(:one))
    assert_equal "Your Pro Phones Order Has Been Delivered", mail.subject
    assert_equal ["test@test.com"], mail.to
    assert_equal ["ProPhonesLtd@gmail.com"], mail.from
    assert_match "Your phone(s) have been successfully delivered. We hope you enjoyed our service. Thank you.", mail.body.encoded
  end

end
