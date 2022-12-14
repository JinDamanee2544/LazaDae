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

    # For Buyer buying items
    def buyItem
        buyMarketItem = Market.find(params[:market_id])
        amount = params[:amount].to_i
        stock = buyMarketItem.stock

        if(amount < 0)
            return redirect_to my_market_path , notice: "Invalid Amount"
        end

        if(amount > stock)
            return redirect_to my_market_path , notice: "Not Enough Stock"
        end    
        userInventory = Inventory.create(
            user_id: session[:current_user_id],
            item_id: buyMarketItem.item_id,
            seller_id: buyMarketItem.user_id,
            price: buyMarketItem.price,
            qty: amount
        )
        buyMarketItem.update(stock: stock-amount)
        redirect_to my_market_path , notice: "You Bought #{Item.find(params[:item_id]).name} for #{amount}"
    end
end
