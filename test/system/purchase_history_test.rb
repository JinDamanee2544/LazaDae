require "application_system_test_case"

class PurchaseHistoryTest < ApplicationSystemTestCase
    setup do
        visit '/login'
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
    end

    test "should_show_purchase_history" do
        click_on("Purchase History")
        assert_selector "h1", text: "Buyer Guy's Purchase History"
        assert_selector "th", text: "Name"
        assert_selector "td", text: "Water"
        assert_selector "th", text: "Category"
        assert_selector "td", text: "Drink"
        assert_selector "th", text: "Price"
        assert_selector "td", text: "10.0"
        assert_selector "th", text: "Amount"
        assert_selector "td", text: "1000"
        assert_selector "th", text: "Picture"
    end
end