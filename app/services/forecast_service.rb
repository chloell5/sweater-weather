class ForecastService
  class << self
    def loc_forecast(loc)
      ForecastClient.get_data("/data/2.5/onecall?lat=#{loc[:lat]}&lon=#{loc[:lng]}")
    end
  end
end
