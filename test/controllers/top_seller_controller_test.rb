require "test_helper"

class TopSellerControllerTest < ActionDispatch::IntegrationTest
  setup do
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end
  
  
  test "should get index" do
    get top_seller_url
    assert_response :success
  end

  test "should get index with params" do
    get top_seller_url, params: { start_date: "2019-01-01", end_date: "2019-01-02", metric: "Sold Item" }
    assert_response :success

    get top_seller_url, params: { start_date: "2019-01-01",   end_date: "2019-01-02", metric: "Revenue" }
    assert_response :success
  end

  test "should get index with invalid date" do
    get top_seller_url, params: { start_date: "2019-01-02", end_date: "2019-01-01", metric: "Sold Item" }
    assert_response :redirect
    assert_equal "End date must be greater than start date", flash[:notice]

    get top_seller_url, params: { start_date: "2019-01-02", end_date: "2019-01-01", metric: "Revenue" }
    assert_response :redirect
    assert_equal "End date must be greater than start date", flash[:notice]
  end

  test "should get index with invalid metric" do
    get top_seller_url, params: { start_date: "2019-01-01", end_date: "2019-01-02", metric: "Invalid" }
    assert_response :redirect
    assert_equal "Invalid metric", flash[:notice]
  end
end
