require 'rails_helper'

RSpec.describe "Roadtrip API" do 
    it "returns travel time adn weather for a road trip based on origin and destination", :vcr do 
        user = User.create!(email: 'email@email.com', password: "password")

        user_login_params = {
                        "email": "email@email.com",
                        "password": "password",
                            }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(user_login_params)
        
        road_trip_attributes = {
            "origin": "Denver, CO",
            "destination": "Loveland, CO",
            "api_key": "#{user.api_key}"
        }
 
        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/roadtrip", headers: headers, params: JSON.generate(road_trip_attributes)
      
        expect(response).to be_successful
        expect(response.status).to eq(200)
    end 

    it 'returns an error if the API is not submitted', :vcr do 
        user = User.create!(email: 'email@email.com', password: "password")

        user_login_params = {
                        "email": "email@email.com",
                        "password": "password",
                            }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/users", headers: headers, params: JSON.generate(user_login_params)
        
        api_key = User.find_by!(email: "email@email.com").api_key
        
        road_trip_attributes = {
            "origin": "Denver, CO",
            "destination": "Loveland, CO",
        }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/roadtrip", headers: headers, params: JSON.generate(road_trip_attributes)

        expect(response.status).to eq(401)
        expect(response.body).to eq('User is unauthorized must submit an API key')
    end 
end 