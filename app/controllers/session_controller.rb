class SessionController < ApplicationController
  def create
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      p "~~~~~~~~~~~~~~~~~~" 
      redirect_to "/organizations"
      p "~~~~~~~~~~~~~~~~~~" 
    else 
      flash[:errors] = ["Invalid Combination"]
      p "****************" 
      redirect_to "/sessions/new"
      p "****************" 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end

end
