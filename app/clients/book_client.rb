class BookClient
  class << self
    def get_data(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(
        url: "http://openlibrary.org/",
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
