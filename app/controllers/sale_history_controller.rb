class SaleHistoryController < ApplicationController
  before_action :must_be_log_in
  before_action :must_be_seller

  def index
    @myUser = User.find(session[:current_user_id])
    @salehistory = Inventory.where(seller_id: session[:current_user_id])
    puts '------------------------'
    puts @Buyhistory
    puts '------------------------'
  end
end
