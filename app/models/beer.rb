class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, presence: true
    accepts_nested_attributes_for :reviews

    def average_rating
       ratings = self.reviews.map {|review| review.rating}
       average = ratings.sum / ratings.count
       average.round
    end
end
