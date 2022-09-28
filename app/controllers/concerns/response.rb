module Response 
    def user_json_response(object, status = :ok)
        render json: UserSerializer.new(object), status: :created
    end 

    def session_json_response(object, status = :ok)
        render json: SessionSerializer.new(object), status: status
    end 

    def road_trip_json_response(object, status = :ok)
        render json: RoadtripSerializer.new(object), status: status
    end 
    
    def error_response(message, status)
        render json: message, status: status
    end
end 