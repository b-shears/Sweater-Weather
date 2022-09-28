require 'rails_helper'

RSpec.describe RoadtripFacade, :vcr do
    it "returns location attributes of latitude and longitude" do 
        result = RoadtripFacade.create_road_trip("Denver, CO", "Loveland, CO")
        expect(result).to be_a(Roadtrip)
    end
end 