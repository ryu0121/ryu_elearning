class StaticpagesController < ApplicationController
  def home
    if logged_in?
      @activities = Activity.where("user_id IN (?) OR user_id=?", current_user.following_ids, current_user.id).paginate(page: params[:page], per_page: 10)
      render 'users/dashboard'
    else
      render 'staticpages/home'
    end
  end

  def about
  end
end
