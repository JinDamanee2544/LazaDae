require "test_helper"

class MyInventoryControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market = markets(:marketBySeller)
    email = 'seller@gmail.com'
    password = 'seller'
    post login_control_path, params: { email: email, password: password }
  end

  test "should get index" do
    get my_inventory_url
    assert_response :success
  end

  test "Seller Edit Item" do
    get edit_market_path(@market.id)
    assert_response :success

    patch market_path(@market.id), params: { market: { price: 1000, stock: 1000 } }
    assert_redirected_to my_inventory_path
    assert_equal "Your item on Market was successfully updated.", flash[:notice]
  end

  test "Seller Edit Item Not Allowed" do
    get edit_market_path(markets(:marketNotAllow).id)
    assert_redirected_to login_path
    assert_equal "You are not allowed to edit this item.", flash[:notice]
  end

  test "Seller Edit Item Not Allowed By patch request" do
    patch market_path(markets(:marketNotAllow).id), params: { market: { price: 1000, stock: 1000 } }
    assert_redirected_to login_path
    assert_equal "You are not allowed to edit this item.", flash[:notice]
  end

  test "Seller Add Item" do
    assert_difference('Market.count',1) do
      post my_inventory_add_item_path, params: { item_name: "Test Item", item_category: "Test Category", price: 1000, stock: 1000 }
    end
    assert_redirected_to my_inventory_path
    assert_equal "Your item has been send to Market, Please wait for Admin to approve this :)", flash[:notice]
  end

  test "Seller Add Item With Picture" do
    assert_difference('Market.count',1) do
      post my_inventory_add_item_path, params: { item_name: "Test Item", item_category: "Test Category", price: 1000, stock: 1000, item_picture: fixture_file_upload('test/fixtures/files/test.png', 'image/png') }
    end
    assert_redirected_to my_inventory_path
    assert_equal "Your item has been send to Market, Please wait for Admin to approve this :)", flash[:notice]
  end

  test "Seller Add Item With invalid number" do
    assert_difference('Market.count',0) do
      post my_inventory_add_item_path, params: { item_name: "Test Item", item_category: "Test Category", price: -1000, stock: 1000 }
    end
    assert_redirected_to my_inventory_path
    assert_equal "Price must be positive", flash[:notice]

    assert_difference('Market.count',0) do
      post my_inventory_add_item_path, params: { item_name: "Test Item", item_category: "Test Category", price: 1000, stock: -1000 }
    end
    assert_redirected_to my_inventory_path
    assert_equal "Stock must be positive", flash[:notice]
  end

  test "Seller Delete Item" do
    assert_difference('Market.count', -1) do
      post my_inventory_delete_item_path, params: { market_id: @market.id }
    end
    assert_redirected_to my_inventory_path
    assert_equal "Your item has been removed from Market", flash[:notice]
  end
end
