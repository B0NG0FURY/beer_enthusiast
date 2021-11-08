class Beer < ApplicationRecord
    belongs_to :brewery
    # belongs_to :style
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, presence: true, uniqueness: true
    validates_associated :brewery
    accepts_nested_attributes_for :reviews
    before_validation :normalize_attributes
    scope :strongest, -> { where('abv > 8') }

    def brewery_attributes=(brewery)
        self.brewery = Brewery.find_or_initialize_by(name: brewery[:name].downcase.titleize)
        if self.brewery.location.nil? || self.brewery.location.blank?
            self.brewery.location = brewery[:location]
        end
    end

    def average_rating
        if !self.reviews.empty?
            ratings = self.reviews.map {|review| review.rating}.compact
            average = ratings.sum / ratings.count
            average.round
        end
    end

    def self.top_ten
        beers = self.all.reject {|beer| beer.average_rating.nil?}
        beers.sort_by {|beer| beer.average_rating}.reverse[0..9]
    end

    private

    def normalize_attributes
        !self.name.blank? ? self.name = self.name.downcase.titleize : nil
        !self.style.blank? ? self.style = self.style.downcase.titleize : nil
    end
end
