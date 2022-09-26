class BookFacade 
    def self.create_books(location, quantity)
        book_json = BookService.search_books(location, quantity)
        number_found = book_json[:numFound]
    
        books = book_json[:docs].map do |book|
            Book.new(book)
        end 
        return books, number_found
    end 
end 