class MapService
  class << self
    def get_location(location)
      loc = MapClient.get_data("/geocoding/v1/address?location=#{location}")

      loc[:results].first[:locations].first[:latLng]
    end
  end
end
