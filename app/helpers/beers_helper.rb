module BeersHelper
    def recent_reviews(beer)
        beer.reviews.reverse[0..4]
    end

    def sort_beers_by_name(array)
        array.sort_by {|beer| beer.name}
    end

    def get_review(user, beer)
        Review.find_by(user_id: user.id, beer_id: beer.id)
    end

    def user_rating(beer)
        review = beer.reviews.select {|review| review.user == current_user}
        review.first.rating
    end
end
