class LocationService 
    def self.conn_location 
        Faraday.new("https://www.mapquestapi.com/geocoding/v1/address") do |faraday|
            faraday.params['key'] = ENV['map_quest_key']
        end 
    end 

    def self.conn_route
        Faraday.new("https://www.mapquestapi.com/directions/v2/route") do |faraday|
            faraday.params['key'] = ENV['map_quest_key']
        end 
    end 

    def self.search_location(location)
        response = conn_location.get("?location=#{location}")
        json = JSON.parse(response.body, symbolize_names: true) if response.status == 200
    end

    def self.route_directions(from, to)
        response = conn_route.get("?from=#{from}&to=#{to}")
        json = JSON.parse(response.body, symbolize_names: true) if response.status == 200
    end 
end 