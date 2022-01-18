class Books
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(data)
    @id                 = nil
    @destination        = data[:destination]
    @forecast           = data[:forecast]
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
end
