class Books
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(data)
    @id                 = nil
    @destination        = data[:destination]
    @forecast           = summarize(data[:forecast])
    @total_books_found  = data[:total_books_found]
    @books              = book(data[:books])
  end

  def book(data)
    data.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end

  def summarize(weather)
    { summary: weather.current_weather[:conditions], temperature: weather.current_weather[:temp].to_s + " F" }
  end
end
