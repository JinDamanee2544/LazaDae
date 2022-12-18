require "application_system_test_case"

class NavbarsTest < ApplicationSystemTestCase
    setup do
        visit login_path
    end

    test "should_show_admin_navbar" do
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on("login")
        assert_selector "h1", text: "Main"

        click_on "Market" , match: :first
        assert_selector "h1", text: "Market"

        click_on "Purchase History", match: :first 
        assert_selector "h1", text: "Admin Guy's Purchase History"

        click_on "Inventory", match: :first 
        assert_selector "h1", text: "Admin Guy's Shop Inventory"

        click_on "Sale History" , match: :first
        assert_selector "h1", text: "Admin Guy's Sale History"

        click_on "Top Seller" , match: :first
        assert_selector "h1", text: "Top Seller"

        click_on 'Scaffold' , match: :first
        within("#dropdown-scaffold") do
            click_on "User" , match: :first
        end
        assert_selector "h1", text: "Users"

        click_on "Scaffold" , match: :first
        within("#dropdown-scaffold") do
            click_on "Item" , match: :first
        end
        assert_selector "h1", text: "Items"

        click_on "Scaffold" 
        within("#dropdown-scaffold") do
            click_on "Inventory" , match: :first
        end
        assert_selector "h1", text: "Inventories"


        click_on "Scaffold"
        within("#dropdown-scaffold") do
            click_on "Market" , match: :first
        end
        assert_selector "h1", text: "Markets"

        click_on "Lazada" 
        assert_selector "h1", text: "Main"

        click_on("Admin Guy")
        click_on("Logout")
        assert_text "You have been logged out"
        assert_selector "h1", text: "Login"
    
    end

    test "should_show_seller_navbar" do
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Main"

        click_on "Inventory", match: :first 
        assert_selector "h1", text: "Seller Guy's Shop Inventory"

        click_on "Sale History" , match: :first
        assert_selector "h1", text: "Seller Guy's Sale History"

        click_on "Top Seller" , match: :first
        assert_selector "h1", text: "Top Seller"

        click_on "Lazada" 
        assert_selector "h1", text: "Main"

        click_on("Seller Guy")
        click_on("Logout")
        assert_text "You have been logged out"
        assert_selector "h1", text: "Login"
    end

    test "should_show_buyer_navbar" do
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
        assert_selector "h1", text: "Main"
        
        
        click_on "Market" , match: :first
        assert_selector "h1", text: "Market"

        click_on "Purchase History", match: :first 
        assert_selector "h1", text: "Buyer Guy's Purchase History"

        click_on "Lazada" 
        assert_selector "h1", text: "Main"

        click_on("Buyer Guy")
        click_on("Logout")
        assert_text "You have been logged out"
        assert_selector "h1", text: "Login"

    end
end