class RoadTripFacade
  class << self
    def road_trip(start_city, end_city)
      route = MapService.get_trip(start_city, end_city)
      forecast = ForecastFacade.forecast(end_city)
      binding.pry
    end
  end
end
