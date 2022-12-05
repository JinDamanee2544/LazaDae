class MyMarketController < ApplicationController
    before_action :must_be_logged_in
    before_action :must_be_buyer

    # For Buyer shopping their cart
    def index
    end
end
