require 'rails_helper'

RSpec.describe Roadtrip do 
    it 'exists and has attributes' do 
            attributes = {
                "start_city": "Denver, CO",
                "end_city": "Estes Park, CO",
                "travel_time": "02:13:00",
                "weather_at_eta": {
                    temp: 59.4,
                    weather:[{id:803, main:"Clouds", description:"broken clouds", icon: "04n"}]
                }
            }

            roadtrip = Roadtrip.new(attributes)

            expect(roadtrip.origin).to eq(attributes[:start_city])
            expect(roadtrip.destination).to eq(attributes[:end_city])
            expect(roadtrip.travel_time).to eq("2 hours, 13 minutes")
            expect(roadtrip.weather_at_destination).to be_a(Hash)
            expect(roadtrip.weather_at_destination[:temperature]).to eq(59.4)
            expect(roadtrip.weather_at_destination[:conditions]).to eq("broken clouds")
    end 
end 