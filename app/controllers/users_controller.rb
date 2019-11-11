class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully Created"
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
       flash[:success] ="Successfully updated"
       redirect_to user_url(current_user)
      #  まだcurrent_userメソッド作ってない
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Successfully deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest, :photo)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
