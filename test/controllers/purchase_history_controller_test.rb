require "test_helper"

class PurchaseHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_history_index_url
    assert_response :success
  end
end
