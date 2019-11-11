class StaticpagesController < ApplicationController
  def home
    if logged_in?
      render 'users/dashboard'
    else
      render 'staticpages/home'
    end
  end

  def about
  end
end
