class MyMarketController < ApplicationController
    before_action :must_be_log_in
    before_action :must_be_buyer

    # For Buyer shopping their cart
    def index
        @allSoldRecord = Market.all
    end

    def BuyItem
        @BuyMarketItem = Market.find(params[:item_id])
        stock = @BuyMarketItem.stock
        @amount = params[:amount]
        puts "------------------------"
        puts "#{User.find(session[:current_user_id]).name} bought #{@amount} of #{@BuyMarketItem.item.name}"
        puts "------------------------"
        if(stock>1)
            @userInventory = Inventory.create(
                user_id: session[:current_user_id],
                item_id: @BuyMarketItem.item_id,
                seller_id: @BuyMarketItem.user_id,
                price: @BuyMarketItem.price,
                qty: @amount
            )
            @BuyMarketItem.update(stock: @BuyMarketItem.stock-1)
        end

        redirect_to my_market_path
    end
end
