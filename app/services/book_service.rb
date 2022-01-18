class BookService
  class << self
    def find_books(loc)
      BookClient.get_data("search.json?q=#{loc}")
    end
  end
end
