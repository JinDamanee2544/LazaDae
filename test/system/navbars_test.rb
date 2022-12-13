require "application_system_test_case"

class NavbarsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit navbars_url
  #
  #   assert_selector "h1", text: "Navbar"
  # end
  setup do
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end

  test "should see navbar" do
    visit login_path
    assert_selector "nav"
  end
  
end
