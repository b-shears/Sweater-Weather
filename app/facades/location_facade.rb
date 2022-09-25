class LocationFacade 
    def self.create_location(location)
        location_json = LocationService.search_location(location)
        latitude_longitude = Location.new(location_json)
    end 
end 