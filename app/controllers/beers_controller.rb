class BeersController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @beers = @user.beers
        else
            @beers = Beer.all
        end
    end

    def new
        redirect_to root_path if !current_user
        @user = current_user
        @beer = Beer.new
        @beer.brewery = Brewery.new
        @beer.reviews.build
    end

    def create
        @user = current_user
        @beer = Beer.new(beer_params)
        if @beer.valid?
            @beer.save
            @beer.brewery.save
            redirect_to beer_path(@beer)
        else
            render :new
        end
    end

    def show
        @beer = Beer.find_by_id(params[:id])
    end

    def top10
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @reviews = user_top_ten(@user)
        else
            @beers = top_ten_beers
        end
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :style, :abv, :ibu, brewery_attributes: [:name, :location], reviews_attributes: [:user_id, :rating, :comment])
    end

    def user_top_ten(user)
        user.reviews.sort_by {|review| review.rating}.reverse[0..9]
    end

    def top_ten_beers
        beers = Beer.all.reject {|beer| beer.average_rating.nil?}
        beers.sort_by {|beer| beer.average_rating}.reverse[0..9]
    end
end
