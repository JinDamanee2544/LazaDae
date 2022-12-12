class MyMarketController < ApplicationController
    before_action :must_be_log_in
    before_action :must_be_buyer

    # For Buyer shopping their cart
    def index
        @onlyEnableItemInMarket = []
        Market.all.each do |record|
            if(record.item.enable)
                @onlyEnableItemInMarket.push(record)
            end
        end
    end

    def buyItem
        buyMarketItem = Market.find_by(item_id:params[:item_id])
        stock = buyMarketItem.stock
        amount = params[:amount]
        puts "------------------------"
        puts "#{User.find(session[:current_user_id]).name} bought #{amount} of #{buyMarketItem.item.name}"
        puts "------------------------"
        if(stock>0)
            @userInventory = Inventory.create(
                user_id: session[:current_user_id],
                item_id: buyMarketItem.item_id,
                seller_id: buyMarketItem.user_id,
                price: buyMarketItem.price,
                qty: amount
            )
            buyMarketItem.update(stock: buyMarketItem.stock-1)
            redirect_to my_market_path
        else
            redirect_to my_market_path , notice: "Out of Stock"
        end

    end
end
