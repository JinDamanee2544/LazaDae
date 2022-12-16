require "application_system_test_case"

class ProfileTest < ApplicationSystemTestCase
    setup do
        #@user = users(:admin)
        visit '/login'
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on "login"
        #assert_selector "h1", text: "Market"
    end

    test "should_show_profile" do
        visit "/my_market"

        #assert_selector "label", text: "Email"
        #assert_selector "label", text: "Name"
        #assert_selector "label", text: "Role"
        #click_on "Change Password"
    end
end