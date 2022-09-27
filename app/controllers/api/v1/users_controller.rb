class Api::V1::UsersController < ApplicationController
    def create 
        user = User.create!(user_params)
        user_json_response(user, :created)
    end 

    private 
        def user_params 
            params.permit(:email.downcase, :password, :password_confirmation)
        end 
end 