require 'rails_helper'

RSpec.describe NRELSearchService, :vcr do 

    # before :each do 
    #     @location = { latitude: 40.44561, longitude: -105.07816 }
    # end 
  

    context "#find_nearest_station(location)" do 
         
        it "can return the nearest electric charging station to your searched location" do 
            location = create(:location)
            json = NRELSearchService.find_nearest_station(location)
            # binding.pry
            expect(json).to be_a(Hash)
            expect(json).to have_key(:latitude)
            expect(json[:latitude]).to eq(40.44561)

            expect(json).to have_key(:longitude)
            expect(json[:longitude]).to eq(-105.07816)

            expect(json).to include(:location_country, :fuel_stations)

            expect(json).to have_key(:location_country)
            expect(json[:location_country]).to eq("US")

            expect(json).to have_key(:fuel_stations)
            
            json[:fuel_stations].each do |fuel_station|
                expect(fuel_station).to have_key(:access_code)
                expect(fuel_station).to have_key(:access_days_time)
                expect(fuel_station).to have_key(:fuel_type_code)
                expect(fuel_station).to have_key(:groups_with_access_code)
                expect(fuel_station).to have_key(:city)
                expect(fuel_station).to have_key(:state)
                expect(fuel_station).to have_key(:street_address)
                expect(fuel_station).to have_key(:zip)
                expect(fuel_station).to have_key(:station_name)
                expect(fuel_station).to have_key(:latitude)
                expect(fuel_station).to have_key(:longitude)
                expect(fuel_station).to have_key(:distance)
            end 
        end 
    end
end 