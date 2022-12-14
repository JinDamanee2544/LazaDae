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
    # lock_version = params[:lock_version]
    item_name = params[:item_name]
    item_category = params[:item_category]
    item_picture = params[:item_picture]
    
    price = params[:price].to_i
    stock = params[:stock].to_i

    if(price<0) 
      return redirect_to my_inventory_path , notice: "Price must be positive"
    end 

    if(stock<0)
      return redirect_to my_inventory_path , notice: "Stock must be positive"
    end

    item = Item.create(
      name: item_name,
      category: item_category,
      enable: false,
      picture: item_picture,
      # lock_version: lock_version
    )
    if(item_picture.present?)
      item.picture.attach(item_picture)
    end
    market = Market.create(
      user_id: user.id,
      item_id: item.id,
      price: price,
      stock: stock,
      # lock_version: lock_version
    )
    redirect_to my_inventory_path , notice: "Your item has been send to Market, Please wait for Admin to approve this :)"
  end

  def delete_item 
    market_id = params[:market_id]
    market = Market.find(market_id)
    market.destroy
    
    # Delete Item when it no more in history or anyone inventory
    
    item = Item.find(market.item_id)
    if(item.inventories.empty?)
      item.destroy
      item.picture.purge
    end

    redirect_to my_inventory_path , notice: "Your item has been removed from Market"
  end
end
