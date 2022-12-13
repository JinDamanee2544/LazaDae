require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:water)
    email = 'admin@gmail.com'
    password = 'admin'
    post login_control_path, params: { email: email, password: password }
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { category: @item.category, enable: @item.enable, name: @item.name } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { category: @item.category, enable: @item.enable, name: @item.name } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    # assert_difference("Item.count", -1) do
    #   delete item_url(@item)
    # end
    # assert_redirected_to items_url
    assert_raises(ActiveRecord::InvalidForeignKey) do
      delete item_url(@item)
    end
  end

  test "should lock item" do
    # Locking caused by another user that fetch the same record but it is not update on the other user yet
    firstItem = Item.find(@item.id)
    laterItem = Item.find(@item.id)

    firstItem.name = "NamSom"
    firstItem.save

    assert_raises(ActiveRecord::StaleObjectError) do
      laterItem.name = "NamDang"
      laterItem.save
    end
  end
end
