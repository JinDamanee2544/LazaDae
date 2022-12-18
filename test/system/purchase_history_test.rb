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
        assert_selector "h1", text: "Buyer"
    end
end