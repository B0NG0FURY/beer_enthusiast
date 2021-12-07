class Brewery < ApplicationRecord
    validates :name, presence: true
    has_many :beers
    before_validation :normalize_attributes

    def average_rating_all_beers
        if self.beers.empty?
            'N/A'
        else
            ratings = self.beers.map {|beer| beer.average_rating}.compact
            average = ratings.sum / ratings.count
            average.round
        end
    end

    private

    def normalize_attributes
        !self.location.blank? ? self.location = self.location.titleize : nil
    end
end
