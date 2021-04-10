module BeersHelper
    def recent_reviews(beer)
        beer.reviews.reverse[0..9]
    end
end
