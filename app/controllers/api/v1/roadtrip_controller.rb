class Api::V1::RoadtripController < ApplicationController
    def create
         if User.exists?(password_digest: params[:api_key])
           
            data = RoadtripFacade.create_road_trip(params[:origin], params[:destination])
         
            road_trip_json_response(data)
         else 
            error_response('User is unauthorized must submit an API key', 401)
         end 
    end 
end