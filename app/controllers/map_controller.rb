class MapController < ApplicationController
    def results
        api = "https://api.openbrewerydb.org/breweries"
        if params[:location]
            @location = params[:location]
        end

        searchable_location = @location.downcase.split(" ").join("_")
        
        if params[:type] == "City"
            response = Excon.new("#{api}?by_city=#{searchable_location}")
        else
            response = Excon.new("#{api}?by_postal=#{searchable_location}")
        end
        response = response.get(:headers => {'Accept' => 'application/json'})
        @breweries = JSON.parse(response.body)
    end
end