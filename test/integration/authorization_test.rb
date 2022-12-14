require "test_helper"

class AuthorizationTest < ActionDispatch::IntegrationTest
    test "Admin should access any page" do
      email = 'admin@gmail.com'
      password = 'admin'
      post login_control_path, params: { email: email, password: password }
      
      pages = [
        login_path, 
        profile_path, 
        my_market_path, 
        my_inventory_path, 
        purchase_history_path, 
        sale_history_path, 
        top_seller_path, 
        items_path, 
        markets_path, 
        inventories_path, 
        users_path
      ]

      pages.each do |page|
        get page
        assert_response :success
      end
    end

    test "Seller should access only certain pages" do
      email = 'seller@gmail.com'
      password = 'seller'
      post login_control_path, params: { email: email, password: password }

      pages = [
        login_path, 
        profile_path, 
        my_inventory_path, 
        sale_history_path, 
        top_seller_path
      ]

      limitedPage = [
        my_market_path,
        purchase_history_path,
        items_path,
        markets_path,
        inventories_path,
        users_path
      ]

      pages.each do |page|
        get page
        assert_response :success
      end

      limitedPage.each do |page|
        get page
        assert_response :redirect
      end
    end 

    test "Buyer should access only certain pages" do
      email = 'buyer@gmail.com'
      password = 'buyer'
      post login_control_path, params: { email: email, password: password }

      pages = [
        login_path, 
        profile_path, 
        my_market_path,
        purchase_history_path
      ]

      limitedPage = [
        my_inventory_path,
        sale_history_path,
        top_seller_path,
        items_path,
        markets_path,
        inventories_path,
        users_path
      ]

      pages.each do |page|
        get page
        assert_response :success
      end

      limitedPage.each do |page|
        get page
        assert_response :redirect
      end
    end 
end
