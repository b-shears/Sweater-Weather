require 'rails_helper'

RSpec.describe "user session API" do 

    it 'can authenticate user credentials' do 
        user = User.create!(email: 'email@email.com', password: "password")

        user_login_params = {
                        "email": "email@email.com",
                        "password": "password",
                            }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/sessions", headers: headers, params: JSON.generate(user_login_params)
        
        session_user = User.find_by!(email: user_login_params[:email])

        expect(response).to be_successful 
        expect(response.status).to eq(200)
        
        

        json = JSON.parse(response.body, symbolize_names: true)
        
        expect(json[:data]).to have_key(:id)
        expect(json[:data]).to have_key(:type)
        expect(json[:data]).to have_key(:attributes)
        expect(json[:data][:attributes]).to have_key(:email)
        expect(json[:data][:attributes][:email]).to eq("email@email.com")
        expect(json[:data][:attributes]).to have_key(:api_key)
        expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
        expect(json[:data][:attributes]).to_not have_key(:password_digest)
    end 

    it "returns an error if the password is incorrect or non-existant" do 
        user = User.create!(email: 'email@email.com', password: "password")

        user_login_params = {
                        "email": "email@email.com",
                        "password": "",
                            }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/sessions", headers: headers, params: JSON.generate(user_login_params)
        
        session_user = User.find_by!(email: user_login_params[:email])

        expect(response.status).to eq(401)
        expect(response.body).to eq("User does not exist, please sign up!")
    end 

      it "returns an error if the email is incorrect or non-existant" do 
        user = User.create!(email: 'email@email.com', password: "password")

        user_login_params = {
                        "email": "dfljd",
                        "password": "password123!",
                            }

        headers = {"CONTENT_TYPE" => "application/json"}

        post "/api/v1/sessions", headers: headers, params: JSON.generate(user_login_params)
        
        expect(response.status).to eq(401)
        expect(response.body).to eq("User does not exist, please sign up!")
    end 
end 