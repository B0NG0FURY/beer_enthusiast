class BreweriesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @breweries = @user.breweries
        else
            @breweries = Brewery.all
        end
    end

    def show
        @brewery = Brewery.find_by_id(params[:id])
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @beers = @user.beers.where(["brewery_id = ?", @brewery.id])
        else
            @beers = @brewery.beers
        end
    end
end
