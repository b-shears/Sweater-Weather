require 'rails_helper'

RSpec.describe LocationFacade, :vcr do
    it "returns location attributes of latitude and longitude" do 
        result = LocationFacade.create_location("Denver, CO")
        expect(result).to be_a(Location)
        expect(result.latitude).to be_a(Float)
        expect(result.longitude).to be_a(Float)
    end
end 