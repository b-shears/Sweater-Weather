 class Api::V1::ForecastController < ApplicationController
    def index 
        location = LocationFacade.create_location(params[:location])

        forecast = ForecastFacade.create_forecast(location.latitude, location.longitude)

        render json: ForecastSerializer.new(forecast)
    end 
 end 