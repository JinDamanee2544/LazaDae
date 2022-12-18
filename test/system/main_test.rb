require "application_system_test_case"

class MainTest < ApplicationSystemTestCase
    setup do
        visit login_path
    end
    test "should_show_admin_link" do
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on("login")
        assert_selector "h1", text: "Main"

        assert_selector "a", text: "my_inventory"
        assert_selector "a", text: "Sale History"
        assert_selector "a", text: "Top Seller"

        assert_selector "a", text: "my_market"
        assert_selector "a", text: "Purchase History"

        assert_selector "a", text: "User"
        assert_selector "a", text: "Item"
        assert_selector "a", text: "Inventory"
        assert_selector "a", text: "Market"

        within('#main-panel') do
        click_on "my_inventory"
        end
        assert_selector "h1", text: "Admin Guy's Shop Inventory"
        visit main_path
        
        within('#main-panel') do
        click_on "Sale History"
        end
        assert_selector "h1", text: "Admin Guy's Sale History"
        visit main_path
        
        within('#main-panel') do
        click_on "Top Seller"
        end
        assert_selector "h1", text: "Top Seller"
        visit main_path

        within('#main-panel') do
            click_on "my_market"
        end
        assert_selector "h1", text: "Market"
        visit main_path

        within('#main-panel') do
        click_on "Purchase History"
        end
        assert_selector "h1", text: "Admin Guy's Purchase History"
        visit main_path

        within('#main-panel') do
        click_on "User"
        end
        assert_selector "h1", text: "Users"
        visit main_path

        within('#main-panel') do
        click_on "Item"
        end
        assert_selector "h1", text: "Items"
        visit main_path

        within('#main-panel') do
        click_on "Inventory"
        end
        assert_selector "h1", text: "Inventories"
        visit main_path
        
        within('#main-panel') do
            click_on "Market"
        end
        assert_selector "h1", text: "Markets"
        visit main_path
        
    end
    
    test "should_show_seller_link" do
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Main"

        assert_selector "a", text: "my_inventory"
        assert_selector "a", text: "Sale History"
        assert_selector "a", text: "Top Seller"

        within('#main-panel') do
        click_on "my_inventory"
        end
        assert_selector "h1", text: "Seller Guy's Shop Inventory"
        visit main_path
        
        within('#main-panel') do
        click_on "Sale History"
        end
        assert_selector "h1", text: "Seller Guy's Sale History"
        visit main_path
        
        within('#main-panel') do
        click_on "Top Seller"
        end
        assert_selector "h1", text: "Top Seller"
        visit main_path
    end
    test "should_show_buyer_link" do
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
        assert_selector "h1", text: "Main"

        assert_selector "a", text: "my_market"
        assert_selector "a", text: "Purchase History"
        
        within('#main-panel') do
            click_on "my_market"
        end
        assert_selector "h1", text: "Market"
        visit main_path

        within('#main-panel') do
        click_on "Purchase History"
        end
        assert_selector "h1", text: "Buyer Guy's Purchase History"
        visit main_path
    end
end