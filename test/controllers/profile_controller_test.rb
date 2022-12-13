require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end
  
  test "should get index" do
    get profile_url
    assert_response :success
  end

  test "Change Password" do
    old_password = 'admin'
    new_password = 'admin1234'
    confirm_password = 'admin1234'
    post profile_changePassword_path, params: { new_password: new_password, confirm_password: confirm_password, old_password: old_password }
    assert_redirected_to(login_path)
    assert_equal("Password changed successfully", flash[:notice])
    assert User.find(@user.id).authenticate(new_password)
  end

  test "Change Password with wrong old password" do
    old_password = 'adminmax'
    new_password = 'admin1234'
    confirm_password = 'admin1234'
    post profile_changePassword_path, params: { new_password: new_password, confirm_password: confirm_password, old_password: old_password }
    assert_redirected_to(profile_path)
    assert_equal("Wrong old password", flash[:notice])
  end

  test "Change Password with wrong confirm password" do
    old_password = 'admin'
    new_password = 'admin1234'
    confirm_password = 'admin12345'
    post profile_changePassword_path, params: { new_password: new_password, confirm_password: confirm_password, old_password: old_password }
    assert_redirected_to(profile_path)
    assert_equal("New password and confirm password do not match", flash[:notice])
  end

  test "Change Password should increase lock_version" do
    old_password = 'admin'
    new_password = 'admin1234'
    confirm_password = 'admin1234'
    assert_difference("User.find(@user.id).lock_version",1) do
      post profile_changePassword_path, params: { new_password: new_password, confirm_password: confirm_password, old_password: old_password }
    end
  end
end
