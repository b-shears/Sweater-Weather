class LocationService 
    def self.conn 
        Faraday.new("https://www.mapquestapi.com/geocoding/v1/address") do |faraday|
            faraday.params['key'] = ENV['map_quest_key']
        end 
    end 

    def self.search_location(location)
        response = conn.get("?location=#{location}")
        json = JSON.parse(response.body, symbolize_names: true) if response.status == 200
    end
end 