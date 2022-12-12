class PurchaseHistoryController < ApplicationController
  before_action :must_be_log_in
  before_action :must_be_buyer
  def index
    @myUser = User.find(session[:current_user_id])
    @buyhistory = Inventory.where(user_id: session[:current_user_id])
    puts '------------------------'
    puts @Buyhistory
    puts '------------------------'
  end
end
