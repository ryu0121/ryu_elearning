class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.paginate(page: params[:page], per_page: 4)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully Created !"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
       flash[:success] ="Successfully updated !"
       redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Successfully deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest, :photo)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
