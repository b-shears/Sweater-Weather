require 'rails_helper'

RSpec.describe NearestStationFacade, :vcr do
    it "returns the nearest charging station attributes" do 
        result = NearestStationFacade.create_nearest_station("Denver, CO")
        expect(result).to be_a(NearestStation)
        expect(result.latitude).to be_a(Float)
        expect(result.longitude).to be_a(Float)
    end
end 