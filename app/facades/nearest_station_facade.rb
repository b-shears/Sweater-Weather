class NearestStationFacade
    def self.create_nearest_station(location)
        nrel_json = NRELSearchService.find_nearest_station(location)
        nearest_station = NearestStation.new(nrel_json)
    end
end 