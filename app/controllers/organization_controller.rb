class OrganizationController < ApplicationController
  before_action :authorize
  def new
  end

  def index
    @organizations = Organization.all
    @user = current_user
    @members = Organization.joins(:member, :user)
  end

  def create
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

  def show
    @organization = Organization.find(params[:id])
  end

  def join
    @organization = Organization.find(params[:id])
    @user = current_user
    @organization.members += [@user]
    redirect_to "/organizations"
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to "/organizations"
  end

  def leave
    @organization = Organization.find(params[:id])
    @user = current_user
    @organization.members.delete(@user)
    redirect_to "/events"
  end

  private

  def authorize
    if !session[:user_id] = current_user
      redirect_to "/"
    end
  end

  def organization_params
    params.require(:organization).permit(:name, :description)
  end
end
