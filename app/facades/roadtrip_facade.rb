class RoadtripFacade
    def self.create_road_trip(from, to)
        travel_time_json = LocationService.route_directions(from, to)
        travel_time = travel_time_json[:route][:formattedTime]

        destination = LocationFacade.create_location(to)
        destination_weather_json = WeatherService.search_location_weather(destination.latitude, destination.longitude)
     
        travel_hours = travel_time_json[:route][:formattedTime][0].to_i
    
        destination_temp = destination_weather_json[:hourly][travel_hours]
            roadtrip = {
                    start_city: from,
                    end_city: to,
                    travel_time: travel_time,
                    weather_at_eta: destination_temp
                        }
        Roadtrip.new(roadtrip)
    end
end 