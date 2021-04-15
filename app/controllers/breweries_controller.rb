class BreweriesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @breweries = @user.breweries
        else
            @breweries = Brewery.all
        end
    end
end
