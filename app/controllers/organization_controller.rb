class OrganizationController < ApplicationController
  def new
  end

  def index
    @organizations = Organization.all
  end

  def create
    @organization = Organization.new(organization_params)
    @user = current_user
    @organization.user = @user
    @organization.members += [@user]
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
  end

  def destroy
    @organization = Organization.find(params[:id])

  end

  def leave
  end

  private
  def organization_params
    params.require(:organiation).permit(:name, :description)
  end
end
