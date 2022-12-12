require "test_helper"

class TopSellerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_seller_index_url
    assert_response :success
  end
end
