class ReviewsController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews
        elsif params[:beer_id]
            @beer = Beer.find_by_id(params[:beer_id])
            @reviews = @beer.reviews
        end
    end

    def new
        @user = current_user
        if @user
            @beer = Beer.find_by_id(params[:beer_id])
            @review = Review.new
        else
            redirect_to beer_path(@beer)
        end
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to beer_path(@review.beer)
        else
            render "new"
        end
    end

    def edit
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:user_id, :beer_id, :rating, :comment)
    end
end
