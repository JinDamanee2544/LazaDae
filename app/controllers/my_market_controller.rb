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
        buyMarketItem = Market.find_by(item_id:params[:item_id])
        stock = buyMarketItem.stock
        amount = params[:amount].to_i
        # puts "------------------------"
        # puts "#{User.find(session[:current_user_id]).name} bought #{amount} of #{buyMarketItem.item.name}"
        # puts "------------------------"

        if(amount < 0)
            return redirect_to my_market_path , notice: "Invalid Amount"
        end

        if(amount > stock)
            return redirect_to my_market_path , notice: "Not Enough Stock"
        end    

        @userInventory = Inventory.create(
            user_id: session[:current_user_id],
            item_id: buyMarketItem.item_id,
            seller_id: buyMarketItem.user_id,
            price: buyMarketItem.price,
            qty: amount
        )
        buyMarketItem.update(stock: buyMarketItem.stock-amount)
        redirect_to my_market_path , notice: "You Bought #{Item.find(params[:item_id]).name} for #{amount}"
    end
end
