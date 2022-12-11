require "test_helper"

class SaleHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sale_history_index_url
    assert_response :success
  end
end
