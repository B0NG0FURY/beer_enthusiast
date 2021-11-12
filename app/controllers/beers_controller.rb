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
        @beer.style = Style.new
        @beer.reviews.build
    end

    def create
        puts params
        @user = current_user
        @beer = Beer.new(beer_params)
        if @beer.valid?
            @beer.save
            @beer.brewery.save
            @beer.style.save
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
            @reviews = @user.personal_top_ten
        else
            @beers = Beer.top_ten
        end
    end

    def strongest
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @beers = @user.beers.strongest.sort_by {|beer| beer.abv}.reverse
            redirect_to beers_strongest_path if !logged_in? || current_user.id != @user.id
        else
            @beers = Beer.strongest.sort_by {|beer| beer.abv}.reverse
        end
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :abv, :ibu, style_attributes: [:id, :name], brewery_attributes: [:name, :location], reviews_attributes: [:user_id, :rating, :comment])
    end
end
