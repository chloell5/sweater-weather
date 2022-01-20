class MapClient
  class << self
    def get_data(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    def get_cities(url, data)
      response = conn.get(url) do |city|
        city.params['from'] = data[:origin]
        city.params['to'] = data[:destination]
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(
        url: 'http://www.mapquestapi.com',
        params: { key: ENV['mapquest_api'] },
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
