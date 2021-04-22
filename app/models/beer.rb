class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, presence: true, uniqueness: true
    validates :brewery_id, presence: true
    accepts_nested_attributes_for :reviews

    def brewery_attributes=(brewery)
        self.brewery = Brewery.find_or_create_by(name: brewery[:name])
        if self.brewery.location.nil?
            self.brewery.update(location: brewery[:location])
        end
    end

    def average_rating
       if !self.reviews.empty?
        ratings = self.reviews.map {|review| review.rating}
        average = ratings.sum / ratings.count
        average.round
       end
    end
end
