class NRELSearchService
    def self.find_nearest_station(location)
        response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&location=#{location}&fuel_type=ELEC&limit=5")
        json = JSON.parse(response.body, symbolize_names: true) 
    end 

    private 

    def self.conn 
        Faraday.new("https://developer.nrel.gov") do |faraday|
            faraday.params['key'] = ENV['nrel_key']
        end
    end 
end 