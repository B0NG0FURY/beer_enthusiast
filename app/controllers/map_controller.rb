class MapController < ApplicationController
    def results
        @location = params[:location]
    end
end