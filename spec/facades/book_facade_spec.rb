require 'rails_helper'

RSpec.describe BookFacade do 

    it 'returns book objects and the number of books found', :vcr do 
        books = BookFacade.create_books("Denver, CO", 5)

        books_found = books[1]

        expect(books_found).to be_an(Integer)

        book_objects = books[0]

        expect(book_objects).to be_an(Array)
        expect(book_objects.count).to eq(5)
        expect(book_objects.first).to be_an_instance_of(Book)
        expect(book_objects.last).to be_an_instance_of(Book)

    end 

end 