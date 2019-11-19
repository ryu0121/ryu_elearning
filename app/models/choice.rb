class Choice < ApplicationRecord
  belongs_to :word
  validates :content, presence: true, uniqueness: true
end