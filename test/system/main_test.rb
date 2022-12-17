require "application_system_test_case"

class MainTest < ApplicationSystemTestCase
    setup do
        #@user = users(:admin)
        visit '/login'
    end

    test "should_show_admin_link" do
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on("login")

        assert_selector "h1", text: "Market"
        assert_selector "a", text: "Market"
        assert_selector "a", text: "Purchase History"
        assert_selector "a", text: "Inventory"
        assert_selector "a", text: "Sale History"
        assert_selector "a", text: "Top Seller"
        assert_selector "a", text: "Scaffold"
    
    end

    test "should_show_seller_link" do
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")

        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        assert_selector "a", text: "Inventory"
        assert_selector "a", text: "Sale History"
        assert_selector "a", text: "Top Seller"

    end

    test "should_show_buyer_link" do
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")

        assert_selector "h1", text: "Market"
        assert_selector "a", text: "Market"
        assert_selector "a", text: "Purchase History"

    end
end