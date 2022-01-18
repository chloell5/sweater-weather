class ForecastFacade
  class << self
    def forecast(loc)
      fc = ForecastService.loc_forecast(coords(loc))
      Forecast.new(fc)
    end

    def coords(loc)
      MapService.get_location(loc)
    end
  end
end
