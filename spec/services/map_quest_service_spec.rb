require 'rails_helper'

RSpec.describe MapQuestService, :vcr do 

    context "#search_location(location)" do 
        it 'can retrieve the latitude and longitude of a city you search for' do 
            location = MapQuestService.search_location("Denver, CO")

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

end 