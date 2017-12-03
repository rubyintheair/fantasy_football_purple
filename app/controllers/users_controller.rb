class UsersController < ApplicationController
  def index 
    @users = User.all 
  end 

  def new 
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      log_in(@user)
      flash[:success] = "Create new user successfully"
      redirect_to root_path
    else 
      flash[:error] = "#{@user.errors.full_messages.to_sentence}"
      redirect_to new_user_path
    end 
  end 

  def user_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end 
end
