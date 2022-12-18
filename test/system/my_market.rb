require "application_system_test_case"

class MyMarketTest < ApplicationSystemTestCase
    setup do
        @market = markets(:market1)
        visit '/login'
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
        assert_selector "h1", text: "Main"
    end

    test "should_show_my_market" do
        visit my_market_path
        assert_selector "h1", text: "Market"
        assert_selector "th", text: "Picture"
        assert_selector "th", text: "Name"
        assert_selector "th", text: "Category"
        assert_selector "th", text: "Price"
        assert_selector "th", text: "Stock"
        assert_selector "th", text: "Seller"
        assert_selector "th", text: "Action"

        assert_selector "td", text: @market.item.name
        assert_selector "td", text: @market.item.category
        assert_selector "td", text: @market.price
        assert_selector "td", text: @market.stock
        assert_selector "td", text: @market.user.name
        assert_selector "input[id^='amount']"
        assert_button "Buy"
    end
end