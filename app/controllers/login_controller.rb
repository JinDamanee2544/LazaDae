class LoginController < ApplicationController
  # before_action :must_be_log_in , only: %i[ user_item inventory ]
  def index
  end

  def loginControl
    if(params[:email].blank?)  
      return redirect_to login_path, notice: "Email cannot be blank" 
    end
    if(params[:password].blank?)  
      return redirect_to login_path, notice: "Password cannot be blank" 
    end

    u = User.where(email: params[:email]).first
    if(u && u.authenticate(params[:password]))
      session[:logged_in] = true
      session[:current_user_id] = u.id
      
      case u.user_type
      when 0
        session[:role] = 'admin'
      when 1
        session[:role] = 'seller'
      when 2
        session[:role] = 'buyer'
      end
      

      redirect_to my_market_path
    else
      redirect_to login_path, notice: "Incorrect username or password"
    end
  end

  def destroy
    reset_session
  end

end
