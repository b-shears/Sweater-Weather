class Api::V1::RoadtripController < ApplicationController
    def create
      user = User.find_by(api_key: params[:api_key])
         if user.nil?
           error_response('User is unauthorized must submit an API key', 401)
         else 
            roadtrip = RoadtripFacade.create_road_trip(params[:origin], params[:destination])
            road_trip_json_response(data)
         end 
    end 
end