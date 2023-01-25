class NRELSearchService
    def self.find_station(location)
        response = conn.get"api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_key']}&location=#{location}&fuel_type=ELEC&limit=1&state=CO"
    end 

    private 

    def self.conn 
        Faraday.new("https://developer.nrel.gov/") do |faraday|
            faraday.params['key'] = ENV['nrel_key']
    end 
end 