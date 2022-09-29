class Api::V1::BooksController < ApplicationController
    def index 
        if params[:quantity].to_i < 1
            render status: :bad_request
        else 
            location = LocationFacade.create_location(params[:location])

            forecast = ForecastFacade.create_forecast(location.latitude, location.longitude)

            books = BookFacade.create_books(params[:location], params[:quantity])

            render json: BooksSerializer.location_forecast_books(params[:location], forecast, books)
        end 
    end 
end 