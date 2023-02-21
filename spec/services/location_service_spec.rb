require 'rails_helper'

RSpec.describe LocationService, :vcr do 
    context "#search_location(location)" do 
        it 'can retrieve the latitude and longitude of a city you search for' do 
            
            expect(location).to be_a(Hash)
            expect(location).to have_key(:results)

            expect(location[:results].first).to have_key(:locations)
            expect(location[:results].first[:locations]).to be_a(Array)

            expect(location[:results].first[:locations].first).to have_key(:latLng)
            expect(location[:results].first[:locations].first[:latLng]).to be_a(Hash)
            
            expect(location[:results].first[:locations].first[:latLng]).to have_key(:lat)
            expect(location[:results].first[:locations].first[:latLng]).to have_key(:lng)

            expect(location[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
            expect(location[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)
        end 
    end

    context "#route_directions(from,to)" do 
        it "can return start city, end city, and travel time for a road trip" do 
            directions = LocationService.route_directions("Denver, CO", "Loveland, CO")

            expect(directions).to be_a(Hash)
            
            expect(directions).to have_key(:route)
            
            expect(directions[:route]).to have_key(:boundingBox)
            
            expect(directions[:route][:boundingBox]).to have_key(:lr)
            expect(directions[:route][:boundingBox][:lr]).to have_key(:lng)
            expect(directions[:route][:boundingBox][:lr][:lng]).to be_a(Float)
            expect(directions[:route][:boundingBox][:lr]).to have_key(:lat)
            expect(directions[:route][:boundingBox][:lr][:lat]).to be_a(Float)
            expect(directions[:route][:boundingBox][:lr][:lat]).to be_a(Float)
            expect(directions[:route]).to have_key(:formattedTime)
            expect(directions[:route][:formattedTime]).to be_a(String)
        end
    end 
end 