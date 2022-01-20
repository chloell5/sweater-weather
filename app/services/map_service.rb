class MapService
  class << self
    def get_location(location)
      loc = MapClient.get_data("/geocoding/v1/address?location=#{location}")

      loc[:results].first[:locations].first[:latLng]
    end

    def get_trip(start, ending)
      MapClient.get_cities('/directions/v2/route', origin: start, destination: ending)[:route]
    end
  end
end
