require 'rails_helper'

RSpec.describe 'nearest station API' do
    it 'sends nearest fuel station data based on the location passed in via the params', :vcr do 
         headers = { "CONTENT_TYPE" => "application/json" }
        # binding.pry
         get "/api/v1/nearest_station", headers: headers, params: { location: 'Loveland, CO' }

         expect(response).to be_successful
      
         json = JSON.parse(response.body, symbolize_names: true)
    end 
end 