class MapController < ApplicationController
    def results
        api = "https://api.openbrewerydb.org/breweries"
        if params[:location]
            @location = params[:location].downcase
        end
        
        if params[:type] == "City"
            response = Excon.new("#{api}?by_city=#{@location}")
            response = response.get(:headers => {'Accept' => 'application/json'})
        else
            response = Excon.new("#{api}?by_postal=#{@location}")
            response = response.get(:headers => {'Accept' => 'application/json'})
        end
        @breweries = JSON.parse(response.body)
    end
end