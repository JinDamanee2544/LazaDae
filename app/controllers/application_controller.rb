class ApplicationController < ActionController::Base
    private
    def is_login?
        return session[:logged_in] == true
    end
    # ---------------------------------------------------------------- #
    def is_admin?
        return session[:role] == 'admin'
    end
    
    def is_seller?
        return session[:role] == 'seller'
    end

    def is_buyer?
        return session[:role] == 'buyer'
    end
    # ---------------------------------------------------------------- #
    def must_be_log_in
        if is_login?
            return true
        else 
            redirect_to login_path , notice: "You must be logged in to access that."
        end
    end

    def must_be_buyer
        if is_buyer? or is_admin?
            return true
        else 
            redirect_to login_path , notice: "You must be a buyer to access that."
        end
    end

    def must_be_seller
        if is_seller? or is_admin?
            return true
        else 
            redirect_to login_path , notice: "You must be a seller to access that."
        end
    end

    def must_be_admin
        if is_admin?
            return true
        else 
            redirect_to login_path , notice: "You must be an admin to access that."
        end
    end
end
