require "application_system_test_case"

class MyInventoryTest < ApplicationSystemTestCase
    setup do
        visit '/login'
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
    end

    test "should_show_sales_history" do
        click_on("Inventory")
        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        assert_selector "th", text: "Name"
        assert_selector "th", text: "Category"
        assert_selector "th", text: "Price"
        assert_selector "th", text: "Stock"
        assert_selector "th", text: "Picture"
    end
end
