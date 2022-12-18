require "application_system_test_case"

class PurchaseHistoryTest < ApplicationSystemTestCase
    setup do
        @inventory = inventories(:inventory1)
        visit '/login'
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
        assert_selector "h1", text: "Main"
    end

    test "should_show_purchase_history" do
        visit purchase_history_path
        assert_selector "h1", text: "Buyer Guy's Purchase History"
        assert_selector "th", text: "Name"
        assert_selector "th", text: "Category"
        assert_selector "th", text: "Price"
        assert_selector "th", text: "Amount"
        assert_selector "th", text: "Picture"
        
        assert_selector "td", text: @inventory.item.name
        assert_selector "td", text: @inventory.item.category
        assert_selector "td", text: @inventory.price
        assert_selector "td", text: @inventory.qty
    end
end