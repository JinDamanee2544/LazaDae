require "application_system_test_case"

class TopSellerTest < ApplicationSystemTestCase
    setup do
        visit '/login'
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
    end

    test "should_show_sales_history" do
        click_on("Top Seller")
        assert_selector "h1", text: "Top Seller"
    end
end