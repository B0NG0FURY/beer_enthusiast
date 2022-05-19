class MapController < ApplicationController
    def results
        api = "https://api.openbrewerydb.org/breweries"
        @location = params[:location].downcase
        
        if params[:type] == "City"
            @breweries = Excon.get("#{api}?by_city=#{@location}")
            puts @breweries.body
        else
            @breweries = Excon.get("#{api}?by_postal=#{@location}")
            puts @breweries.body
        end
    end
end