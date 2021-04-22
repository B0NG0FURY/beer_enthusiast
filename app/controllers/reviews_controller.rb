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
        @beer = Beer.find_by_id(params[:beer_id])
        if @user && !user_reviewed?(@beer)
            @review = Review.new
        else
            redirect_to beer_path(params[:beer_id])
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
        redirect_to root_path if current_user != @review.user
    end

    def update
        @review = Review.find_by_id(params[:id])
        if @review.update(review_params)
            redirect_to beer_path(@review.beer)
        else
            render "edit"
        end
    end

    private

    def review_params
        params.require(:review).permit(:user_id, :beer_id, :rating, :comment)
    end
end
