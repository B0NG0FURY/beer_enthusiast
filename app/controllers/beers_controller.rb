class BeersController < ApplicationController

    def new
        redirect_to root_path if !current_user
        @user = current_user
        @beer = Beer.new
        @beer.reviews.build
    end

    def create
        brewery = Brewery.find_or_create_by(name: params[:beer][:brewery])
        beer = Beer.new(brewery: brewery)
        if beer.update(beer_params)
            redirect_to user_beer_path(current_user, beer)
        else
            redirect_to new_beer_path
        end
    end

    def show
        @beer = Beer.find_by_id(params[:id])
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :style, :abv, :ibu, reviews_attributes: [:user_id, :rating, :comment])
    end

end
