require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { phone_id: phones(:iphone).id }
    end

    follow_redirect!
    
    assert_select 'h2', 'Shopping Cart'
    assert_select 'td', "Apple iPhone 12 Pro"
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { phone_id: @line_item.phone_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { phone_id: phones(:iphone).id },
      xhr: true
    end
    assert_response :success
    assert_match /<tr class=\\"highlight-line-item/, @response.body
  end
end