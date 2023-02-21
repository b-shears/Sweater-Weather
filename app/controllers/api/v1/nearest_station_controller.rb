 class Api::V1::NearestStationController < ApplicationController
    def index 
        location = LocationFacade.create_location(params[:location])
        # binding.pry
        nearest_station = NearestStationFacade.create_nearest_station(location)

        render json: NearestStationSerializer.new(nearest_station)
    end 
 end