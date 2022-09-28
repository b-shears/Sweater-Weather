require 'rails_helper'

RSpec.describe "GET Books Search Endpoint" do 

    it 'sends a books data based on the search parameters', :vcr do 
        headers = { "CONTENT_TYPE" => "application/json" }
        get '/api/v1/books', headers: headers, params: { location: 'Denver, CO', quantity: 5 }

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to have_key(:data)

        expect(json[:data]).to have_key(:id)
        expect(json[:data]).to have_key(:type)
        expect(json[:data]).to have_key(:attributes)

        data = json[:data][:attributes]

        expect(data).to have_key(:destination)
        expect(data).to have_key(:forecast)
        expect(data[:forecast]).to be_a(Hash)
        expect(data[:forecast]).to have_key(:summary)
        expect(data[:forecast]).to have_key(:temperature)

        expect(data).to have_key(:total_books_found)
        expect(data[:total_books_found]).to be_an Integer

        expect(data).to have_key(:books)
        expect(data[:books]).to be_an Array
        expect(data[:books].count).to eq(5)
        
        data[:books].each do |book|
            expect(book).to be_a Hash
            expect(book).to have_key(:isbn)
            expect(book).to have_key(:title)
            expect(book).to have_key(:publisher)
        end
    end 


    it 'returns 400 error if quantity sent is not greater than 0', :vcr do
        headers = { "CONTENT_TYPE" => "application/json" }
        get '/api/v1/books', headers: headers, params: { location: 'Denver, CO', quantity: -1 }

        expect(response).to have_http_status(400)
    end
end 

