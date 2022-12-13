require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end
  
  test "should get index" do
    get profile_url
    assert_response :success
  end
end
