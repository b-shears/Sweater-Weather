require 'rails_helper'

RSpec.describe 'Create User' do 

    it 'creates a User and returns a json response via the serializer' do 
        user_params = {
                        "email": "email@email.com",
                        "password": "password",
                        "password_confirmation": "password"
                      }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

        new_user = User.last 

        expect(response).to be_successful 
        expect(response.status).to eq(200)

        expect(response.body).to include("email@email.com")
    end 
end