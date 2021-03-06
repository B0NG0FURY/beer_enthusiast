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
        breweries = JSON.parse(response.body)
        breweries = breweries.select {|brewery| brewery["street"] != nil }
        breweries = breweries.map do |brewery|
            if brewery["longitude"] == nil || brewery["latitude"] == nil
                location = Geocoder.search("#{brewery["street"].split(" Ste ")[0]} #{brewery["city"]} #{brewery["state"]}")
                if !location.empty?
                    brewery["longitude"] = location.first.longitude.to_s
                    brewery["latitude"] = location.first.latitude.to_s
                    brewery
                end
            else
                brewery
            end
        end
        @breweries = breweries.select {|brewery| brewery != nil}

        location_coords = Geocoder.search("#{@location}, #{@breweries.first["state"]}")
        @location_lat = location_coords.first.latitude.to_s
        @location_lng = location_coords.first.longitude.to_s
    end
end