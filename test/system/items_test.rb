require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:water)
    visit login_path
    email = 'admin@gmail.com'
    password = 'admin'
    fill_in "Email", with: users(:admin).email
    fill_in "Password", with: "admin"
    click_on("login")
    assert_selector "h1", text: "Main"
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Category", with: @item.category
    check "Enable" if @item.enable
    fill_in "Name", with: @item.name
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Category", with: @item.category
    check "Enable" if @item.enable
    fill_in "Name", with: @item.name
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end
=begin
  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
=end
end
