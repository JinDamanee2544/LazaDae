require "application_system_test_case"

class MarketsTest < ApplicationSystemTestCase
  setup do
    @market = markets(:market1)
    visit login_path
    email = 'admin@gmail.com'
    password = 'admin'
    fill_in "Email", with: users(:admin).email
    fill_in "Password", with: "admin"
    click_on("login")
    assert_selector "h1", text: "Main"
  end

  test "visiting the index" do
    visit markets_url
    assert_selector "h1", text: "Markets"
  end

  test "should create market" do
    visit markets_url
    click_on "New market"

    within "select[id^='market_item_id']"do
        select @market.item.name
    end
    fill_in "Price", with: @market.price
    fill_in "Stock", with: @market.stock
    within "select[id^='market_user_id']"do
        select @market.user.name
    end
    click_on "Create Market"

    assert_text "Market was successfully created"
    click_on "Back"
  end

  test "should update Market" do
    visit market_url(@market)
    click_on "Edit this market", match: :first

    within "select[id^='market_item_id']"do
        select @market.item.name
    end
    fill_in "Price", with: @market.price
    fill_in "Stock", with: @market.stock
    within "select[id^='market_user_id']"do
        select @market.user.name
    end
    click_on "Update Market"

    assert_text "Market was successfully updated"
    click_on "Back"
  end

  test "should destroy Market" do
    visit market_url(@market)
    click_on "Destroy this market", match: :first

    assert_text "Market was successfully destroyed"
  end
end
