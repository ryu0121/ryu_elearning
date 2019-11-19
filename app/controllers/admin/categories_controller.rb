class Admin::CategoriesController < ApplicationController
before_action :admin_user
before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Created !"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Successfully Updated"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Successfully deleted"
    redirect_to admin_categories_url
  end

  private

    def category_params
      params.require(:category).permit(:title, :description)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
