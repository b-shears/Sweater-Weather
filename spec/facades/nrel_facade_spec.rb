require 'rails_helper'

RSpec.describe LocationFacade, :vcr do
    it "returns the nearest charging station attributes" do 
        result = NRELFacade.create_nearest_station("Denver, CO")
        expect(result).to be_a(NREL)
        expect(result.latitude).to be_a(Float)
        expect(result.longitude).to be_a(Float)
    end
end 