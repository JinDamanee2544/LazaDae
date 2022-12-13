require "test_helper"

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:inventory1)
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference("Inventory.count") do
      post inventories_url, params: { inventory: { item_id: @inventory.item_id, price: @inventory.price, qty: @inventory.qty, seller_id: @inventory.seller_id, user_id: @inventory.user_id } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { item_id: @inventory.item_id, price: @inventory.price, qty: @inventory.qty, seller_id: @inventory.seller_id, user_id: @inventory.user_id } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference("Inventory.count", -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end

  test "should lock inventory" do
    # Locking caused by another user that fetch the same record but it is not update on the other user yet
    firstInventory = Inventory.find(@inventory.id)
    laterInventory = Inventory.find(@inventory.id)

    firstInventory.qty = 10
    firstInventory.save

    assert_raises(ActiveRecord::StaleObjectError) do
      laterInventory.qty = 20
      laterInventory.save
    end
  end
end
