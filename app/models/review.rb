class Review < ApplicationRecord
    belongs_to :user
    belongs_to :beer
    validates :rating, presence: true
    validates :comment, presence: true
end
