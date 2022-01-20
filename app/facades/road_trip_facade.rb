class RoadTripFacade
  class << self
    def road_trip(start_city, end_city)
      route = MapService.get_trip(start_city, end_city)
      forecast = ForecastFacade.forecast(end_city)
      travel_time = format_time(route)
      time = eta(route)

      route_details = {
        start_city: start_city,
        end_city: end_city,
        travel_time: travel_time,
        weather: forecast,
        time: time
      }
      RoadTrip.new(route_details)
    end

    def format_time(route)
      route[:formattedTime].split(':') if route[:routeError][:errorCode] == (-400)
    end

    def eta(route)
      Time.zone.now + route[:realTime] if route[:routeError][:errorCode] == (-400)
    end
  end
end
