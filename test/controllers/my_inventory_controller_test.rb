require "test_helper"

class MyInventoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_inventory_index_url
    assert_response :success
  end
end
