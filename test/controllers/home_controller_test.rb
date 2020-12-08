require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_url
    assert_response :success

    assert_select 'title', 'Pro Phones'
  end

  test "should get contact" do
    get contact_url
    assert_response :success
   
    assert_template layout: 'application'
   
    assert_select 'title', 'Contact - Pro Phones'
    assert_select 'h1', 'Talk To Our Team'
    assert_match 'p', "You are not going to hit a ridiculously long phone menu when you call us."
  end

  test "should post request contact but no email" do
    post request_contact_url

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post request_contact_url, params:{name: "Test", email: "test@test.com", phone: "1234567890", message: "This is a test message"}
    assert_response :redirect
      assert_nil flash[:alert]
      assert_not_empty flash[:notice]
  end

end
