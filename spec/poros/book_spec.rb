require 'rails_helper'

RSpec.describe Book do
    
     it 'exists and has attributes' do
        book = Book.new(isbn: [42, 1], title: "Hitchhiker's Guide to the Galaxy", publisher: ["Harper-Collins"])

        expect(book).to be_an_instance_of(Book)
        expect(book.isbn).to eq([42, 1])
        expect(book.title).to eq("Hitchhiker's Guide to the Galaxy")
        expect(book.publisher).to eq(["Harper-Collins"])
    end
    
    
    # it 'exists and has attributes' do 
    #     json_response = file_fixture('spec_book_data.txt').read 
    #     data = JSON.parse(json_response, symbolize_names: true)

    #     book = Book.new(data)

    #     expect(book).to be_a Book
    #     expect(book.isbn).to be_an Array
    #     expect(book.isbn.first).to eq("0762507845")
    #     expect(book.title).to eq("Denver")

    #     expect(book.publisher).to be_an Array
    #     expect(book.publisher.first).to eq("Universal Map Enterprises")
    # end 
end 