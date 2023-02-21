FactoryBot.define do
   factory :location do
    address { Faker::Address.full_address }
   end 
end 