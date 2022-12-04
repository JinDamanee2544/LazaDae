class ApplicationController < ActionController::Base
    private
    def is_login?
        return session[:logged_in] == true
    end

    def must_be_log_in
        if is_login?
            return true
        else 
            redirect_to main_login_path , notice: "You must be logged in to do that."
        end
    end
end
