class Api::V1::SessionsController < ApplicationController
   def create 
        user = User.find_by(email: params[:email])
            if user&.authenticate(params[:password])
                 session_json_response(user)
             else 
                error_response("User does not exist, please sign up!", 401)
            end
        end
    end 

     # def create
    #     user = User.find_by(email: params[:email].downcase)
    #       if user.nil? 
    #         error_response("User does not exist, please sign up!", 401)
    #       elsif user.authenticate(params[:password])
    #         session_json_response(user)
    #       end 
    # end 
