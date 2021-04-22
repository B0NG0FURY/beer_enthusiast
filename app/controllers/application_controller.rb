class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :user_reviewed?
    
    def current_user
        User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def sort_reviews_by(owner, type)
        owner.reviews.sort_by {|review| review.type}
    end

    def user_reviewed?(beer)
        beer.reviews.any? {|review| review.user == current_user}
    end
end
