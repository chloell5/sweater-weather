class BookFacade
  class << self
    def book_search(loc)
      bs = BookService.find_books(loc)
      bs[:docs].map do |book|
        Book.new(book)
      end
    end

    def forecast(loc)
      fc = ForecastService.loc_forecast(coords(loc))
      Forecast.new(fc)
    end

    def coords(loc)
      MapService.get_location(loc)
    end
  end
end
