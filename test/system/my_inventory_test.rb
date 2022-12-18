require "application_system_test_case"

class MyInventoryTest < ApplicationSystemTestCase
    setup do
        @market = markets(:market1)
        visit login_path
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Main"
    end

    test "should_show_my_inventory" do
        visit my_inventory_path
        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        assert_selector "th", text: "Picture"
        assert_selector "th", text: "Name"
        assert_selector "th", text: "Category"
        assert_selector "th", text: "Price"
        assert_selector "th", text: "Stock"
        assert_selector "th", text: "Status"
        assert_selector "th", text: "Action"

        assert_selector "td", text: @market.item.name
        assert_selector "td", text: @market.item.category
        assert_selector "td", text: @market.price
        assert_selector "td", text: @market.stock
        assert_selector "td", text: "Enable"
        assert_selector "a", text: "Edit"
        assert_button "Delete"
        
        assert_button "Add Item to Market"
    end

    test "Able to add item to market" do
        visit my_inventory_path
        click_on("Add Item to Market")
        fill_in "Item Name", with: items(:water).name
        fill_in "Item Category", with: items(:water).category
        fill_in "Price", with: markets(:market1).price
        fill_in "Stock", with: markets(:market1).stock
        click_on "Add"

        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        assert_text "Your item has been send to Market, Please wait for Admin to approve this :)"
    end
end
