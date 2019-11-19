class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validates :content, presence: true, length: {maximum: 50}

  def correct_answer
    choices.find_by(isCorrect: true).try(:content)
  end
end