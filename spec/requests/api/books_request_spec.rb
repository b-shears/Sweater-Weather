require 'rails_helper'

RSpec.describe "GET Books Search Endpoint" do 

    it 'sends a books data based on the search parameters' do 
        headers = { "CONTENT_TYPE" => "application/json" }
        get '/api/v1/books', headers: headers, params: { location: 'Denver, CO', quantity: 5 }

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to have_key(:data)
    end 
end 

