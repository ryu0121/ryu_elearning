class Admin::UsersController < ApplicationController
  before_action :admin_user
  def home
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:admin, true)
      redirect_to admin_users_url
    else
      render :index
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:admin, false)
      redirect_to admin_users_url
    else
      render :index
    end
  end
end
