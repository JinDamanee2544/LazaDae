require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:inventory1)
    visit login_path
    email = 'admin@gmail.com'
    password = 'admin'
    fill_in "Email", with: users(:admin).email
    fill_in "Password", with: "admin"
    click_on("login")
    assert_selector "h1", text: "Main"
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "should create inventory" do
    visit inventories_url
    click_on "New inventory"

    within "select[id^='inventory_user_id']"do
        select @inventory.user.name
    end
    within "select[id^='inventory_item_id']"do
        select @inventory.item.name
    end
    within "select[id^='inventory_seller_id']"do
        select @inventory.seller.name
    end
    fill_in "Price", with: @inventory.price
    fill_in "Qty", with: @inventory.qty
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "should update Inventory" do
    visit inventory_url(@inventory)
    click_on "Edit this inventory", match: :first

    within "select[id^='inventory_user_id']"do
    select @inventory.user.name
    end
    within "select[id^='inventory_item_id']"do
        select @inventory.item.name
    end
    within "select[id^='inventory_seller_id']"do
    select @inventory.seller.name
    end
    fill_in "Price", with: @inventory.price
    fill_in "Qty", with: @inventory.qty
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory" do
    visit inventory_url(@inventory)
    click_on "Destroy this inventory", match: :first

    assert_text "Inventory was successfully destroyed"
  end
end
