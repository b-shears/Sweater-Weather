require 'rails_helper'

RSpec.describe Location do 
    it 'exists and has attributes' do 
        attributes = { 
                        "lat": 39.738453,
                        "lng": -104.984853
                     }
        
        location = Location.new(attributes)

        expect(location).to be_a(Location)
        
        expect(location.latitude).to eq(attributes[:lat])
        expect(location.longitude).to eq(attributes[:lng])
    end 
end 