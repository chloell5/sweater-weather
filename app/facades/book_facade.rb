class BookFacade
  class << self
    def get_info(loc)
      fc = ForecastFacade.forecast(loc)

      bs = BookService.find_books(loc)

      bc = bs[:numFound]

      books = bs[:docs]

      Books.new(destination: loc, forecast: fc, total_books_found: bc, books: books)
    end
  end
end
