class BookService
  def self.search_books(location, quantity)
    conn = Faraday.new("http://openlibrary.org/")
    response = conn.get("search.json?q=#{location}&limit=#{quantity}")
    JSON.parse(response.body, symbolize_names: true)
  end
end