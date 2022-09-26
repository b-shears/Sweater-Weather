require 'rails_helper'

RSpec.describe 'forecasts API' do
    it 'sends forecast data based on the location that is passed in the params', :vcr do
        headers = { "CONTENT_TYPE" => "application/json" }
        get "/api/v1/forecast", headers: headers, params: { location: 'Denver, CO' }
        
        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)

        forecast = json[:data]
        expect(forecast).to have_key(:id)
        expect(forecast[:id]).to eq nil
        expect(forecast).to have_key(:type)
        expect(forecast).to have_key(:attributes)
        expect(forecast[:attributes]).to have_key(:current_weather)
        expect(forecast[:attributes][:current_weather]).to be_a(Hash)
        expect(forecast[:attributes]).to have_key(:daily_weather)
        expect(forecast[:attributes][:daily_weather]).to be_a(Array)
        expect(forecast[:attributes]).to have_key(:hourly_weather)
        expect(forecast[:attributes][:hourly_weather]).to be_a(Array)
    end
end