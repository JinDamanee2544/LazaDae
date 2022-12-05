class MyInventoryController < ApplicationController
  # For Seller managing their sold items
  before_action :must_be_seller

  def index
    @soldRecord = User.find(session[:current_user_id]).markets
  end

end
