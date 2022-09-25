require 'rails_helper'

RSpec.describe Forecast do 

    it 'exists and has attributes' do 
        json_response = file_fixture('spec_weather_data.txt').read 

        data = JSON.parse(json_response, symbolize_names: true)

        forecast = Forecast.new(data)

        expect(forecast).to be_a(Forecast)

        expect(forecast.id).to be(nil)

        expect(forecast.current_weather).to be_a(Hash)
        expect(forecast.current_weather).to have_key(:datetime)
        expect(forecast.current_weather).to have_key(:sunrise)
        expect(forecast.current_weather).to have_key(:sunset)
        expect(forecast.current_weather).to have_key(:temperature)
        expect(forecast.current_weather).to have_key(:feels_like)
        expect(forecast.current_weather).to have_key(:humidity)
        expect(forecast.current_weather).to have_key(:uvi)
        expect(forecast.current_weather).to have_key(:visibility)
        expect(forecast.current_weather).to have_key(:conditions)
        expect(forecast.current_weather).to have_key(:icon)

        expect(forecast.daily_weather).to be_a(Array)
        expect(forecast.daily_weather[0]).to have_key(:datetime)
        expect(forecast.daily_weather[0]).to have_key(:sunrise)
        expect(forecast.daily_weather[0]).to have_key(:sunset)
        expect(forecast.daily_weather[0]).to have_key(:max_temp)
        expect(forecast.daily_weather[0]).to have_key(:min_temp)
        expect(forecast.daily_weather[0]).to have_key(:conditions)
        expect(forecast.daily_weather[0]).to have_key(:icon)

        expect(forecast.hourly_weather).to be_a(Array)
        expect(forecast.hourly_weather[0]).to have_key(:time)
        expect(forecast.hourly_weather[0]).to have_key(:temperature)
        expect(forecast.hourly_weather[0]).to have_key(:conditions)
        expect(forecast.hourly_weather[0]).to have_key(:icon)
    end
end 