class UserController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      p "~~~~~~~~~~~~~~~~~~"
      redirect_to "/organizations"
    else
      flash[:errors] = @user.errors.full_messages
      p "##################"
      redirect_to "/"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
