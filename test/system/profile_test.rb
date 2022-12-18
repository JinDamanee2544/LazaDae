require "application_system_test_case"

class ProfileTest < ApplicationSystemTestCase
    setup do
        #@user = users(:admin)
        visit login_path
    end

    test "should_show_profile_admin" do
        fill_in "Email", with: users(:admin).email
        fill_in "Password", with: "admin"
        click_on("login")
        assert_selector "h1", text: "Main"
        
        click_on("Admin Guy")
        click_on("Profile")
        assert_selector "h1", text: "Profile"
        assert_selector "label", text: "Email"
        assert_selector "label", text: "Name"
        assert_selector "label", text: "Role"
    
    end

    test "should_show_profile_seller" do
        fill_in "Email", with: users(:seller).email
        fill_in "Password", with: "seller"
        click_on("login")
        assert_selector "h1", text: "Main"
        
        click_on("Seller Guy")
        click_on("Profile")
        assert_selector "h1", text: "Profile"
        assert_selector "label", text: "Email"
        assert_selector "label", text: "Name"
        assert_selector "label", text: "Role"
    end

    test "should_show_profile_buyer" do
        fill_in "Email", with: users(:buyer).email
        fill_in "Password", with: "buyer"
        click_on("login")
        assert_selector "h1", text: "Main"
        
        click_on("Buyer Guy")
        click_on("Profile")
        assert_selector "h1", text: "Profile"
        assert_selector "label", text: "Email"
        assert_selector "label", text: "Name"
        assert_selector "label", text: "Role"
    end
end