class ForecastClient
  class << self
    def get_data(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(
        url: 'https://api.openweathermap.org',
        params: {
          appid: ENV['weather_api'],
          exclude: 'minutely,alerts',
          units: 'imperial'
        },
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
