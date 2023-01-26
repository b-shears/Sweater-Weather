class NREL 
    attr_reader :latitude, :longitude, :location_country
    def initialize(data)
        @latitude = data[:latitude]
        @longitude= data[:longitude]
        @location_country = data[:location_country]
    end 



end 