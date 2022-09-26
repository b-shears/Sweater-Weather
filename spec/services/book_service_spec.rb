

require 'rails_helper'

RSpec.describe BookService do

  it 'returns Book JSON data for a given location and quantity', :vcr do
    location = 'denver,co'
    quantity = 5
    response = BookService.search_books(location, quantity)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:numFound)
    expect(response[:numFound]).to be_an(Integer)
    expect(response).to have_key(:docs)
    expect(response[:docs]).to be_an(Array)

    response[:docs].each do |book|
      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an Array
    end 
  end 
end 
