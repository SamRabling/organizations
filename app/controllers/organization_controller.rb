class OrganizationController < ApplicationController
  def new
  end

  def index
    @organizations = Organization.all
    @user = current_user
  end

  def create
    if session[:user_id] = nil
      redirect_to "/"
    else
      @organization = Organization.new(organization_params)
      @user = current_user
      @organization.user = @user
      if @organization.save
        p "~~~~~~~~~~~~~~~~~~"
        redirect_to "/organizations"
      else
        flash[:errors] = @event.errors.full_messages
        p "##################"
        redirect_to "/organizations"
      end
    end
  end

  def show
    if session[:user_id] = nil
      redirect_to "/"
    else
    @organization = Organization.find(params[:id])
    end
  end

  def join
    if session[:user_id] = nil
      redirect_to "/"
    else
    @organization = Organization.find(params[:id])
    @user = current_user
    @organization.members += [@user]
    redirect_to "/organizations"
    end
  end

  def destroy
    if session[:user_id] = nil
      redirect_to "/"
    else
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to "/organizations"
    end
  end

  def leave
    if session[:user_id] = nil
      redirect_to "/"
    else
    @organization = Organization.find(params[:id])
    @user = current_user
    @organization.members.delete(@user)
    redirect_to "/events"
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :description)
  end
end
