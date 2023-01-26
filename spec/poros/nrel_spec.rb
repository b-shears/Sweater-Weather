require 'rails_helper'

RSpec.describe NREL do 
    it "exists and has attributes" do 
        json_response = file_fixture("spec_nearby_station_data.txt").read 

        data = JSON.parse(json_response, symbolize_names: true)

        nearest_station = NREL.new(data)

        expect(nearest_station).to be_a(NREL)

        expect(nearest_station.latitude).to eq(40.44561)
        expect(nearest_station.longitude).to eq(-105.07816)
        expect(nearest_station.location_country).to eq("US")

    end 


end 