class Choice < ApplicationRecord
  belongs_to :word
  belongs_to :answer
  validates :content, presence: true
end