require 'rails_helper'

RSpec.describe NearestStation do 
    it "exists and has attributes" do 
        json_response = file_fixture("spec_nearby_station_data.txt").read 

        data = JSON.parse(json_response, symbolize_names: true)

        nearest_station = NearestStation.new(data)

        expect(nearest_station).to be_a(NearestStation)

        expect(nearest_station.latitude).to eq(40.44561)
        expect(nearest_station.longitude).to eq(-105.07816)
        expect(nearest_station.location_country).to eq("US")
      
        expect(nearest_station.address).to eq("375 west 37th street Loveland, CO 80538")
        expect(nearest_station.fuel_type).to eq("ELEC")
        expect(nearest_station.public_station).to eq("public")
        expect(nearest_station.hours_available).to eq("24 hours daily")
        expect(nearest_station.station_name).to eq("LOVELAND HA2018 LOVELAND HA2018")
        expect(nearest_station.distance).to eq(0.99441)
    end 
end 