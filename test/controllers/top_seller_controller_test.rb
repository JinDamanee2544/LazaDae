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
end
