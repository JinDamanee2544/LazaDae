class SaleHistoryController < ApplicationController
  def index
    @myUser = User.find(session[:current_user_id])
    @salehistory = Inventory.where(seller_id: session[:current_user_id])
    puts '------------------------'
    puts @Buyhistory
    puts '------------------------'
  end
end
