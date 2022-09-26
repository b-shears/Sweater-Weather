require 'rails_helper'

RSpec.describe Book do
  it 'exists and has attributes' do
    book = Book.new(isbn: [42, 1], title: "Hitchhiker's Guide to the Galaxy", publisher: ["Harper-Collins"])

    expect(book).to be_an_instance_of(Book)
    expect(book.isbn).to eq([42, 1])
    expect(book.title).to eq("Hitchhiker's Guide to the Galaxy")
    expect(book.publisher).to eq(["Harper-Collins"])
  end
end