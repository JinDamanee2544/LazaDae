class MyInventoryController < ApplicationController
  before_action :must_be_log_in
  before_action :must_be_seller
  
  # For Seller managing their sold items
  # For Market Model
  def index
    @soldRecord = User.find(session[:current_user_id]).markets
  end

end
