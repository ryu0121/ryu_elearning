class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if  user && user.authenticate(params[:session][:password])
      log_in user
      flash[:info] = "Successfully logged in"
      redirect_to root_url
    else
      render :new
      flash.now[:danger] = "Invalid Credentions"
    end
  end

  def destroy
    log_out
    flash[:info] = "Successfully logged out"
    redirect_to root_url
  end
end
