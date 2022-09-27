module Response 
    def user_json_response(object, status = :ok)
        render json: UserSerializer.new(object), status: :created
    end 

    def error_response(message, status)
        render json: message, status: status
    end
end 