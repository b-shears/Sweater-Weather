require 'rails_helper'

RSpec.describe WeatherService, :vcr do 
    context "#search_location_weather(latitude, longitude)" do 
        it 'can return weather attributes for a specific lat & long' do 
            json = WeatherService.search_location_weather(39.73, -104.98)
            # binding.pry
            expect(json).to be_a(Hash)
           
            expect(json).to have_key(:lat)
            expect(json[:lat]).to eq(39.73)

            expect(json).to have_key(:lon)
            expect(json[:lon]).to eq(-104.98)

            expect(json).to include(:current, :hourly, :daily)
            expect(json).to_not include(:minutely, :alerts)

            expect(json).to have_key(:current)
            expect(json[:current]).to have_key(:dt)
            expect(json[:current]).to have_key(:sunrise)
            expect(json[:current]).to have_key(:sunset)
            expect(json[:current]).to have_key(:feels_like)
            expect(json[:current]).to have_key(:uvi)
            expect(json[:current]).to have_key(:visibility)
            expect(json[:current]).to have_key(:uvi)
            expect(json[:current][:weather][0]).to have_key(:description)
            expect(json[:current][:weather][0]).to have_key(:icon)

            #next 8 hours
            expect(json).to have_key(:daily)
            expect(json[:daily][0]).to have_key(:dt)
            expect(json[:daily][0]).to have_key(:sunrise)
            expect(json[:daily][0]).to have_key(:sunset)
            expect(json[:daily][0][:temp]).to have_key(:max)
            expect(json[:daily][0][:temp]).to have_key(:min)
            expect(json[:daily][0][:weather][0]).to have_key(:description)
            expect(json[:daily][0][:weather][0]).to have_key(:icon)

            expect(json).to have_key(:hourly)
            expect(json[:hourly][0]).to have_key(:dt)
            expect(json[:hourly][0]).to have_key(:temp)
            expect(json[:hourly][0][:weather][0]).to have_key(:description)
            expect(json[:hourly][0][:weather][0]).to have_key(:icon)
        end 
    end 
end 