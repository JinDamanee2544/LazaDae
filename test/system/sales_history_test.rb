require "application_system_test_case"

class SalesHistoryTest < ApplicationSystemTestCase
    setup do
        @inventory = inventories(:inventory1)
        visit login_path
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Main"
    end

    test "should_show_sales_history" do
        visit sale_history_path
        assert_selector "h1", text: "Seller Guy's Sale History"
        assert_selector "th", text: "Name"
        assert_selector "th", text: "Category"
        assert_selector "th", text: "Price"
        assert_selector "th", text: "Picture"
        assert_selector "th", text: "Amount"
        assert_selector "th", text: "Buyer"
        
        assert_selector "td", text: @inventory.item.name
        assert_selector "td", text: @inventory.item.category
        assert_selector "td", text: @inventory.price
        assert_selector "td", text: @inventory.qty
        assert_selector "td", text: @inventory.user.name
    end
end