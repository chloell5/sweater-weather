class BackgroundClient
  class << self
    def get_data(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(
        url: "https://api.unsplash.com/",
        headers: { 'Content-Type' => 'application/json', 'Accept-Version' => 'v1', 'Authorization' => "Client-ID #{ENV['background_api']}" }
      )
    end
  end
end
