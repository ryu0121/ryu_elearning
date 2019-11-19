class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    # 上はwords_controllerの中で、rails routesで確認したrouteが:idの代わりに:category_idを使っているから
    @words = @category.words.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end

  def create

    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Successfully Created !"
      redirect_to admin_category_words_url
    else
      render :new
    end
  end


  private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :isCorrect, :content])
    end
end