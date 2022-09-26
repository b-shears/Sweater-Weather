class BooksSerializer
   def self.location_forecast_books(location, forecast, books)
    {
    "data": {
        "id": "nil",
        "type": "books",
        "attributes": {
        "destination": "#{location}",
        "forecast": {
            "summary": "#{forecast.current_weather[:conditions]}",
            "temperature": "#{forecast.current_weather[:temperature]}" 
        },
        "total_books_found": books[1],
        "books": books[0].map do |book|
            {
            "isbn": book.isbn,
            "title": book.title,
            "publisher": book.publisher
            }
        end 
        }
       }
      }
    end 
end 