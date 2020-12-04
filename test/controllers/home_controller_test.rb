require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    # get root_url
    # assert_response :success

    # assert_select 'title', 'Pro Phones'
    # assert_select 'h1', 'My Notes'
    # assert_select 'p', 'Welcome to my notes site!'
  end

  test "should get contact" do
    get contact_url
    assert_response :success
   
    assert_template layout: 'application'
   
    assert_select 'title', 'Pro Phones'
    assert_select 'h1', 'Talk To Our Team'
    assert_select 'p', "You are not going to hit a ridiculously long phone menu when you call us. Your email isn't going to the spam folder, never to be seen or heard from again. At Pro Phones, we provide exceptional customer service we'd want to experience ourselves. We will get back to you as soon as possible with the best solution for your query."
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
