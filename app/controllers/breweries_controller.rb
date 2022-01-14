class BreweriesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @breweries = @user.breweries.order(:name).page params[:page]
            redirect_to breweries_path if !logged_in? || current_user.id != @user.id
        else
            @breweries = Brewery.all.order(:name).page params[:page]
        end
    end

    def show
        @brewery = Brewery.find_by_id(params[:id])
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @beers = @user.beers.where(["brewery_id = ?", @brewery.id])
            redirect_to brewery_path(@brewery) if !logged_in? || current_user.id != @user.id
        else
            @beers = @brewery.beers
        end
    end
end
