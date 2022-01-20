class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @id             = nil
    @start_city     = data[:start_city]
    @end_city       = data[:end_city]
    @travel_time    = time(data)
    @weather_at_eta = weather(data)
  end

  private

  def time(data)
    if data[:time].nil?
      'impossible route'
    else
      "#{data[:travel_time][0]} hours #{data[:travel_time][1]} minutes"
    end
  end

  def weather(data)
    if time(data) == 'impossible route'
      {}
    else
      weather = data[:weather].hourly_weather.find do |hour|
        timecheck = Time.now.hour + data[:travel_time].first.to_i
        timecheck -= 24 if timecheck >= 24
        hour[:datetime].hour == timecheck
      end
      {
        temperature: weather[:temp],
        conditions: weather[:conditions]
      }
    end
  end
end
