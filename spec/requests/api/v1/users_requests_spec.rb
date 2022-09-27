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
        expect(response.status).to eq(201)

        expect(response.body).to include("email@email.com")
    end 

    it 'returns an error if user does not enter passwords that match' do 
        user_params = { "email": "email@email.com",
                        "password": "password",
                         "password_confirmation": "WORD"
                      }

        headers = {"CONTENT_TYPE" => "application/json"}
        
        post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

        expect(response.status).to eq(422)
        expect(response.body).to include("Validation failed: Password confirmation doesn't match Password")
    end 

    it 'returns an error if the email has already been taken' do 
        user_params = {
                        "email": "email@email.com",
                        "password": "password",
                        "password_confirmation": "password"
                      }
        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
        
        post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

        expect(response.status).to eq(422)
        expect(response.body).to include("Validation failed: Email has already been taken")
    end 

     it 'returns an error if a field is left blank' do 
        user_params = {
                        "email": "",
                        "password": "password",
                        "password_confirmation": "password"
                      }
        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
        
        expect(response.status).to eq(422)
        expect(response.body).to include("Validation failed: Email can't be blank")
    end 
end