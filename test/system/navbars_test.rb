require "application_system_test_case"

class NavbarsTest < ApplicationSystemTestCase
    setup do
        #@user = users(:admin)
        visit '/login'
    end

    test "should_show_admin_navbar" do
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on("login")
        assert_selector "h1", text: "Market"

        click_on("Market")
        assert_selector "h1", text: "Market"
        click_on("Purchase History")
        assert_selector "h1", text: "Admin Guy's Purchase History"
        click_on("Inventory")
        assert_selector "h1", text: "Admin Guy's Shop Inventory"
        click_on("Sale History")
        assert_selector "h1", text: "Admin Guy's Sale History"
        click_on("Top Seller")
        assert_selector "h1", text: "Top Seller"

        click_on("Scaffold")
        click_on("User")
        assert_selector "h1", text: "Users"
        click_on("Scaffold")
        click_on("Item")
        assert_selector "h1", text: "Items"
        click_on("Scaffold")
        click_on("Inventory")
        assert_selector "h1", text: "Inventories"
        click_on("Scaffold")
        click_on("Market")
        assert_selector "h1", text: "Markets"


        click_on("Admin Guy")
        click_on("Logout")
        assert_text "You have been logged out"
        assert_selector "h1", text: "Login"
    
    end

    test "should_show_profile_seller" do
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        
        visit "/profile"
        assert_selector "label", text: "Email"
        assert_selector "label", text: "Name"
        assert_selector "label", text: "Role"
        assert_selector "a", text: "Inventory"
        assert_selector "a", text: "Sale History"
        assert_selector "a", text: "Top Seller"

        click_on("Seller Guy")
        click_on("Logout")
        assert_text "You have been logged out"
        assert_selector "h1", text: "Login"
    end

    test "should_show_profile_buyer" do
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
        assert_selector "h1", text: "Market"
        
        visit "/profile"
        assert_selector "label", text: "Email"
        assert_selector "label", text: "Name"
        assert_selector "label", text: "Role"
        assert_selector "a", text: "Market"
        assert_selector "a", text: "Purchase History"

        click_on("Buyer Guy")
        click_on("Logout")
        assert_text "You have been logged out"
        assert_selector "h1", text: "Login"

    end
end