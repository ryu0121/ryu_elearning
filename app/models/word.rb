class Word < ApplicationRecord
    belongs_to :category
    validates :content, presence: true, length: {maximum: 50}
end
