class TopSellerController < ApplicationController
  def index
    if(params[:start_date].present? && params[:end_date].present?)
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      if(@start_date > @end_date)
        return redirect_to top_seller_path , notice: "End date must be greater than start date"
      end
      if(params[:metric]=="Sold Item")
        @top_seller_item = Inventory.where('created_at BETWEEN ? AND ?', @start_date, @end_date).group(:seller_id).select('seller_id, SUM(qty) as criteria').order('criteria desc')
      else
        @top_seller_price = Inventory.where('created_at BETWEEN ? AND ?', @start_date, @end_date).group(:seller_id).select('seller_id, SUM(qty*price) as criteria').order('criteria desc')
      end
    else
      # Default is all time top seller by sold item
      # @top_seller_item = Inventory.group(:seller_id).select('seller_id, SUM(qty) as criteria').order('criteria desc')
    end
  end

end
