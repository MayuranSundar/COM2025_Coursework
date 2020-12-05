require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  
  test "should return contact email" do
    mail = ContactMailer.contact_email("test@test.com", "Test", "1234567890", @message = "This is a test message")
    assert_equal ['ProPhonesLtd@gmail.com'], mail.to
    assert_equal ['ProPhonesLtd@gmail.com'], mail.from
    assert_equal 'Pro Phones Customer Query', mail.subject
  end

end
