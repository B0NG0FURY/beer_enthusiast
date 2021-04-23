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
        beer = Beer.new(beer_params)
        if beer.save
            redirect_to beer_path(beer)
        else
            redirect_to new_beer_path
        end
    end

    def show
        @beer = Beer.find_by_id(params[:id])
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :style, :abv, :ibu, brewery_attributes: [:name, :location], reviews_attributes: [:user_id, :rating, :comment])
    end

end
