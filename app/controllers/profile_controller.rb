class ProfileController < ApplicationController
  def index
    @user = User.find(session[:current_user_id])
  end

  def changePassword
    user = User.find(session[:current_user_id])
    new_password = params[:new_password]
    confirm_password = params[:confirm_password]
    old_password = params[:old_password]

    puts '---------------------- test ----------------------'

    if(user.authenticate(old_password)==false)
      redirect_to profile_path, notice: "Wrong old password"
    elsif(new_password != confirm_password)
      redirect_to profile_path, notice: "New password and confirm password do not match"
    else
      user.update(password: new_password)
      redirect_to login_path, notice: "Password changed successfully"
    end
  end
end
