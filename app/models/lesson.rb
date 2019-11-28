class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  belongs_to :category
  belongs_to :user
  has_one :activity, as: :action, dependent: :destroy

  def next_word
    (category.words - words).first
    # （カテゴリー内の全部のワード-answer経由でみた答えたワード）の頭からみていってる
  end

  def lesson_results
    choices.where(isCorrect: true).count
  end
end