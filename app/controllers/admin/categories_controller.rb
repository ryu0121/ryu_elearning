class Admin::CategoriesController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Created !"
      redirect_to admin_categories_url
    else
      flash.now[:danger] = "Invalid category"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

    def category_params
      params.require(:category).permit(:title, :description)
    end
end
