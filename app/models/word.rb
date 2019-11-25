class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  belongs_to :answer
  validates :content, presence: true, length: {maximum: 50}
  validate :has_one_correct_answer, :has_unique_choices

  def correct_answer
    choices.find_by(isCorrect: true).try(:content)
  end

  def has_one_correct_answer
    unless choices.select{|choice|choice.isCorrect}.count == 1
      return errors.add :base, 'Choices should have one correct answer'
    end
  end

  def has_unique_choices
    if choices.uniq{|choice|choice.content}.count < choices.length
      return errors.add :base, 'Choices should have unique answer'
    end
  end
end