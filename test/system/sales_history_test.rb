require "application_system_test_case"

class SalesHistoryTest < ApplicationSystemTestCase
    setup do
        visit '/login'
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
    end

    test "should_show_sales_history" do
        click_on("Sale History")
        assert_selector "h1", text: "Seller Guy's Sale History"
        assert_selector "th", text: "Name"
        assert_selector "th", text: "Category"
        assert_selector "th", text: "Price"
        assert_selector "th", text: "Picture"
        assert_selector "th", text: "Amount"
        assert_selector "th", text: "Buyer"
    end
end