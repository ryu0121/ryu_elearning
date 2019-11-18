class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @categories = Category.paginate(page: params[:page], per_page: 10)
    @words = Word.paginate(page: params[:page], per_page: 10)
  end
end