class LoginController < ApplicationController
  # before_action :must_be_log_in , only: %i[ user_item inventory ]
  def index
  end

  def loginControl
    u = User.where(email: params[:email]).first
    if(u && u.authenticate(params[:password]))
      session[:logged_in] = true
      session[:current_user_id] = u.id

      session[:is_admin] = u.user_type==0
      session[:is_seller] = u.user_type==1
      session[:is_buyer] = u.user_type==2

      redirect_to users_path
    else
      redirect_to login_path, notice: "Incorrect username or password"
    end
  end

  def destroy
    reset_session
  end

end
