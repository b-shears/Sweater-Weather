class NearestStation
    attr_reader :latitude, :longitude, :location_country,
                :address, :fuel_type, :public_station, :hours_available, 
                :station_name, :distance

    def initialize(data)
        @latitude = data[:latitude]
        @longitude= data[:longitude]
        @location_country = data[:location_country]
        @address =  data[:fuel_stations].first[:street_address] + " " + data[:fuel_stations].first[:city] + ", " + data[:fuel_stations].first[:state] + " " + data[:fuel_stations].first[:zip]
        @fuel_type = data[:fuel_stations].first[:fuel_type_code]
        @public_station = data[:fuel_stations].first[:access_code]
        @hours_available = data[:fuel_stations].first[:access_days_time]
        @station_name = data[:fuel_stations].first[:station_name]
        @distance = data[:fuel_stations].first[:distance]
    end 
end 