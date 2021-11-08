class StylesController < ApplicationController
    def index
        @styles = Style.all
    end

    def show
        @style = Style.find_by_id(params[:id])
        @beers = @style.beers
    end
end
