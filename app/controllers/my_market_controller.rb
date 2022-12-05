class MyMarketController < ApplicationController
    before_action :must_be_log_in
    before_action :must_be_buyer

    # For Buyer shopping their cart
    def index
        @allSoldRecord = Market.all
    end
end
