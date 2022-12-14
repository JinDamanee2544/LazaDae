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
    visit login_path
    fill_in "email", with: email
    fill_in "password", with: password
    click_on "Login"
  end

  test "should see navbar" do
    visit login_path
    assert_selector "nav"
  end
  
end
