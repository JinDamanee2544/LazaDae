require "application_system_test_case"

class MarketTest < ApplicationSystemTestCase
    setup do
        #@user = users(:admin)
        visit '/login'
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
    end

    test "should create market" do
        click_on("Add Item to Market")
        fill_in "Item Name", with: markets(:market1).item
        fill_in "Item Category", with: items(:water).category
        fill_in "Price", with: markets(:market1).price
        fill_in "Stock", with: markets(:market1).stock
        click_on "Add"
        assert_selector "h1", text: "Seller Guy's Shop Inventory"
    
    end
end