class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  belongs_to :category
  belongs_to :user

  def next_word
    (category.words - words).first
  end

  def lesson_results
    choices.where(isCorrect: true).count
  end
end