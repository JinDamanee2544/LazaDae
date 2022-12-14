require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get login_path
    assert_response :success
  end

  test "User login and logout" do
    post login_control_path, params: {email: "admin@gmail.com", password: "admin"}
    assert session[:logged_in]
    assert_equal User.find_by(email:'admin@gmail.com').id , session[:current_user_id]

    post logout_path
    assert_redirected_to login_path 
    assert_not session[:logged_in]
    assert_nil session[:current_user_id]
    assert_equal "You have been logged out", flash[:notice]
  end

  test "Admin Login and get his role" do 
    post login_control_path, params: {email: "admin@gmail.com", password: "admin"}
    assert_equal "admin", session[:role]
  end

  test "Seller Login and get his role" do
    post login_control_path, params: {email: "seller@gmail.com",password: "seller"}
    assert_equal "seller", session[:role]
  end

  test "Buyer Login and get his role" do
    post login_control_path, params: {email: "buyer@gmail.com", password: 'buyer'}
    assert_equal "buyer", session[:role]
  end
end
