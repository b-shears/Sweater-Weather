require 'rails_helper'

RSpec.describe Location do 
    it 'exists and has attributes' do 
        json_response = file_fixture('spec_location_data.txt').read 

        data = JSON.parse(json_response, symbolize_names: true)
        
        location = Location.new(data)
        
        expect(location).to be_a(Location)
       
        expect(location.latitude).to eq(39.738453)
        expect(location.longitude).to eq(-104.984853)
    end 
end 