require 'rails_helper'

RSpec.describe 'ForecastFacade' do 
    it 'returns a Forecast object for location', :vcr do 
        forecast = ForecastFacade.create_forecast('39.73', '-104.98')

        expect(forecast).to be_a(Forecast)
    end 
end 