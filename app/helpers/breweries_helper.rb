module BreweriesHelper
    def sort_breweries_by_name(array)
        array.sort_by {|brewery| brewery.name}.uniq
    end
end
