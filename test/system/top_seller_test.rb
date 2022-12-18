require "application_system_test_case"

class TopSellerTest < ApplicationSystemTestCase
    setup do
        @inventory = inventories(:inventory1)
        @inventoryWinner = inventories(:inventoryWinner)
        visit '/login'
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Main"
        visit top_seller_path
    end
    
    test "should_show_sort_by_Revenue" do
        within "select[id^='metric']"do
            select "Sold Item"
        end
        fill_in "Start date", with: value = "2022-12-11"
        fill_in "End date", with: value = "2022-12-18"
        click_on("Search")
        assert_selector "h4", text: "Sorted by Sold Item"
    end

    test "should_show_sort_by_sold_item" do
        within "select[id^='metric']"do
            select "Revenue"
        end
        fill_in "Start date", with: value = "2022-12-11"
        fill_in "End date", with: value = "2022-12-18"
        click_on("Search")
        assert_selector "h4", text: "Sorted by Revenue"
    end
    test "should_show_error_text" do
        within "select[id^='metric']"do
            select "Revenue"
        end
        fill_in "Start date", with: value = "2022-12-18"
        fill_in "End date", with: value = "2022-12-11"
        click_on("Search")
        assert_selector "h4", text: "End date must be greater than start date"
    end

    test "Ranking Revenue should be correct" do
        within "select[id^='metric']"do
            select "Revenue"
        end
        fill_in "Start date", with: value = Date.today-7
        fill_in "End date", with: value = Date.today
        click_on("Search")
        assert_selector "h4", text: "Sorted by Revenue"
        assert_selector "tr:nth-child(1)" do
            assert_selector "td", text: @inventoryWinner.seller.name
            assert_selector "td", text: 100000
        end
        assert_selector "tr:nth-child(2)" do
            assert_selector "td", text: @inventory.seller.name
            assert_selector "td", text: 10
        end
    end

    test "Ranking Item should be correct" do
        within "select[id^='metric']"do
            select "Sold Item"
        end
        fill_in "Start date", with: value = Date.today-7
        fill_in "End date", with: value = Date.today
        click_on("Search")
        assert_selector "h4", text: "Sorted by Sold Item"
        assert_selector "tr:nth-child(1)" do
            assert_selector "td", text: @inventoryWinner.seller.name
            assert_selector "td", text: 1000
        end
        assert_selector "tr:nth-child(2)" do
            assert_selector "td", text: @inventory.seller.name
            assert_selector "td", text: 1
        end
    end
end