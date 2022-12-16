require "application_system_test_case"

class ProfileTest < ApplicationSystemTestCase
    setup do
        #@user = users(:admin)
        visit '/login'
    end

    test "should_show_profile_admin" do
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on("login")
        assert_selector "h1", text: "Market"
        
        visit "/profile"

        assert_selector "label", text: "Email"
        assert_selector "label", text: "Name"
        assert_selector "label", text: "Role"
        assert_selector "a", text: "Market"
        assert_selector "a", text: "Purchase History"
        assert_selector "a", text: "Inventory"
        assert_selector "a", text: "Sale History"
        assert_selector "a", text: "Top Seller"
        assert_selector "a", text: "Scaffold"

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