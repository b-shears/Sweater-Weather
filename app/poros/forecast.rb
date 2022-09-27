class Forecast
    attr_reader :id, :current_weather, :daily_weather, :hourly_weather

    def initialize(data)
        @id = nil 
        @current_weather = format_current_weather(data[:current])
        @daily_weather = format_daily_weather(data[:daily])
        @hourly_weather = format_hourly_weather(data[:hourly])
    end 


    def format_current_weather(current_weather)
        current = { datetime: Time.at(current_weather[:dt]),
                    sunrise: Time.at(current_weather[:sunrise]),
                    sunset: Time.at(current_weather[:sunset]),
                    temperature: current_weather[:temp],
                    feels_like: current_weather[:feels_like],
                    humidity: current_weather[:humidity],
                    uvi: current_weather[:uvi],
                    visibility: current_weather[:visibility],
                    conditions: current_weather[:weather][0][:description],
                    icon: current_weather[:weather][0][:icon]
                  }   
    end 

    def format_daily_weather(daily_weather)
        daily_weather.map do |day|
            {  datetime: Time.at(day[:dt]),
               sunrise: Time.at(day[:sunrise]),
               sunset: Time.at(day[:sunset]),
               max_temp: day[:temp][:max],
               min_temp: day[:temp][:min],
               conditions: day[:weather][0][:description],
               icon: day[:weather][0][:icon]
            }
            end
    end


    def format_hourly_weather(hourly_weather)
        hourly_weather.map do |hour|
            { time: Time.at(hour[:dt]),
              temperature: hour[:temp],
              conditions: hour[:weather][0][:description],
              icon: hour[:weather][0][:icon]
            }
        end
    end 
end 