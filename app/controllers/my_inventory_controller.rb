class MyInventoryController < ApplicationController
  before_action :must_be_log_in
  before_action :must_be_seller
  
  # For Seller managing their sold items
  # For Market Model
  def index
    @myUser = User.find(session[:current_user_id])
    @soldRecord = User.find(session[:current_user_id]).markets
  end

  # For Seller adding new items
  def add_item
    user = User.find(session[:current_user_id])
    lock_version = params[:lock_version]
    item_name = params[:item_name]
    item_category = params[:item_category]
    item_picture = params[:item_picture]
    
    price = params[:price]
    stock = params[:stock]

    item = Item.create(
      name: item_name,
      category: item_category,
      enable: false,
      picture: item_picture,
      lock_version: lock_version
    )
    if(!item_picture.nil?)
      item.picture.attach(item_picture)
    end
    market = Market.create(
      user_id: user.id,
      item_id: item.id,
      price: price,
      stock: stock,
      lock_version: lock_version
    )
    redirect_to my_inventory_path , notice: "Your item has been send to Market, Please wait for Admin to approve this :)"
  end

  def delete_item 
    market_id = params[:market_id]
    market = Market.find(market_id)
    market.destroy
    # No Delete Item, We needed to keep the record of sold items
    # item = Item.find(market.item_id)
    # item.destroy
    redirect_to my_inventory_path , notice: "Your item has been removed from Market"
  end
end
