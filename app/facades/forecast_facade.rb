class ForecastFacade 
    def self.create_forecast(latitude, longitude)
        forecast_json = WeatherService.search_location_weather(latitude, longitude)
      
        forecast = Forecast.new(forecast_json)
    end
end 