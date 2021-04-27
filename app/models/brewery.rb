class Brewery < ApplicationRecord
    validates :name, presence: true
    has_many :beers

    def average_rating_all_beers
        ratings = self.beers.map {|beer| beer.average_rating}.compact
        average = ratings.sum / ratings.count
        average.round
    end
end
