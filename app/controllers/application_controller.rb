class ApplicationController < ActionController::Base
    private
    def is_login?
        return session[:logged_in] == true
    end
    
    def is_admin?
        return session[:is_admin] == true
    end
    
    def is_seller?
        return session[:is_seller] == true
    end

    def is_buyer?
        return session[:is_buyer] == true
    end


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
end
