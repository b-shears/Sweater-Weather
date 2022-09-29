class Api::V1::RoadtripController < ApplicationController
    def create
      
         if User.exists?(api_key: params[:api_key])
           
            data = RoadtripFacade.create_road_trip(params[:origin], params[:destination])
         
            road_trip_json_response(data)
         else 
            error_response('User is unauthorized must submit an API key', 401)
         end 
    end 

   # def create 
   #    user = User.find_by(api_key: params[:api_key])

   #    if user.nil?
   #        error_response('User is unauthorized must submit an API key', 401)
   #    else 
   #       data = RoadtripFacade.create_road_trip(params[:origin], params[:destination])
   #       road_trip_json_response(data)
   #    end
   # end 
end