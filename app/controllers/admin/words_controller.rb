class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    # 上はwords_controllerの中だから:idの代わりに:category_idを使っている
    @categories = Category.paginate(page: params[:page], per_page: 10)
    @words = @category.words.paginate(page: params[:page], per_page: 10)
  end
end