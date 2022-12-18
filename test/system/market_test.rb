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
        fill_in "Item Name", with: items(:water).name
        fill_in "Item Category", with: items(:water).category
        fill_in "Price", with: markets(:market1).price
        fill_in "Stock", with: markets(:market1).stock
        click_on "Add"

        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        assert_text "Your item has been send to Market, Please wait for Admin to approve this :)"
        assert_selector "th", text: "Name"
        assert_selector "td", text: "Water"
        assert_selector "th", text: "Category"
        assert_selector "td", text: "Drink"
        assert_selector "th", text: "Price"
        assert_selector "td", text: "10.0"
        assert_selector "th", text: "Stock"
        assert_selector "td", text: "10"
        assert_selector "th", text: "Picture"
    
    end
end