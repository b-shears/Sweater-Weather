class WeatherService
    def self.search_location_weather(latitude, longitude)
        response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts&units=imperial")
        json = JSON.parse(response.body, symbolize_names: true) 
    end

    private
    
    def self.conn
        Faraday.new("https://api.openweathermap.org") do |faraday|
            faraday.params['appid'] = ENV['open_weather_key']
        end
    end 
end 