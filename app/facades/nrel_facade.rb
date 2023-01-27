class NRELFacade 
    def self.create_nearest_station(nearest_station)
        nrel_json = NRELSearchService.find_nearest_station(nearest_station)
        nearest_station = NREL.new(nrel_json)
    end

end 