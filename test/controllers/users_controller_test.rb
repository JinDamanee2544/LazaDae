require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end
  

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest, user_type: @user.user_type } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest, user_type: @user.user_type } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    # assert_difference("User.count", -1) do
    #   delete user_url(@user)
    # end
    # assert_redirected_to users_url
    assert_raises(ActiveRecord::InvalidForeignKey) do
      delete user_url(@user)
    end
  end

  test "should lock user" do
    # Locking caused by another user that fetch the same record but it is not update on the other user yet
    firstUser = User.find(@user.id)
    laterUser = User.find(@user.id)

    firstUser.name = "Prayuth"
    firstUser.save

    assert_raises(ActiveRecord::StaleObjectError) do
      laterUser.name = "Prawit"
      laterUser.save
    end
  end
end
