require "test_helper"

class MyMarketControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market = markets(:market1)
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end
  
  test "should get index" do
    get my_market_url
    assert_response :success
  end

  test "Buy 1 Item" do
    assert_difference("Market.find(@market.id).stock",-1) do
      post my_market_buyItem_path, params: { item_id: @market.item.id, amount: 1 }
    end
    assert_redirected_to(my_market_path)
    assert_equal("You Bought #{@market.item.name} for 1", flash[:notice])
  end

  test "Buy 5 Item" do
    assert_difference("Market.find(@market.id).stock",-5) do
      post my_market_buyItem_path, params: { item_id: @market.item.id, amount: 5 }
    end
    assert_redirected_to(my_market_path)
    assert_equal("You Bought #{@market.item.name} for 5", flash[:notice])
  end

  test "Buy Item with invalid amount" do
    assert_no_difference("Market.find(@market.id).stock") do
      post my_market_buyItem_path, params: { item_id: @market.item.id, amount: -1 }
    end
    assert_redirected_to(my_market_path)
    assert_equal("Invalid Amount", flash[:notice])
  end

  test "Buy Item more than stock" do
    assert_no_difference("Market.find(@market.id).stock") do
      post my_market_buyItem_path, params: { item_id: @market.item.id, amount: 100 }
    end
    assert_redirected_to(my_market_path)
    assert_equal("Not Enough Stock", flash[:notice])
  end

  test "Buy Item should increase lock_version" do
    assert_difference("Market.find(@market.id).lock_version",1) do
      post my_market_buyItem_path, params: { item_id: @market.item.id, amount: 1 }
    end
  end
end
