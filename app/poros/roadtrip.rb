class Roadtrip 
    attr_reader :origin, :destination, :travel_time, :weather_at_destination
    
    def initialize(data)
        @origin = data[:start_city]
        @destination = data[:end_city]
        @travel_time = format_time(data[:travel_time])
        @weather_at_destination = format_weather(data[:weather_at_eta])
    end 

    def format_time(time)
        split_time = time.split(/:/)
        hour = split_time[0].to_i
        minute = split_time[1].to_i
        "#{hour} hours, #{minute} minutes"
    end 

    def format_weather(weather)
        {    temperature: weather[:temp],
             conditions: weather[:weather][0][:description]
        }
    end
end 

