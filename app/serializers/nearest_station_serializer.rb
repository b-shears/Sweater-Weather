class NearestStationSerializer
     include JSONAPI::Serializer
     attributes :id, :latitude , :longitude, :location_country, :address, 
                :fuel_type, :public_station, :hours_available, :station_name,
                :distance
end 
