class Forecast
  attr_reader :id,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(data)
    @id = nil
    @current_weather  = current(data[:current])
    @hourly_weather   = hourly(data[:hourly].take(8))
    @daily_weather    = daily(data[:daily].take(5))
  end

  def current(info)
    {
      datetime: Time.at(info[:dt]).to_datetime,
      sunrise: Time.at(info[:sunrise]).to_datetime,
      sunset: Time.at(info[:sunset]).to_datetime,
      temp: info[:temp],
      feels_like: info[:feels_like],
      humidity: info[:humidity],
      visibility: info[:visibility],
      uvi: info[:visibility],
      conditions: info[:weather].first[:description],
      icon: info[:weather].first[:icon]
    }
  end

  def hourly(info)
    info.map do |hour|
      {
        datetime: Time.at(hour[:dt]).to_datetime,
        temp: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end

  def daily(info)
    info.map do |day|
      {
        datetime: Time.at(day[:dt]).to_datetime,
        sunrise: Time.at(day[:sunrise]).to_datetime,
        sunset: Time.at(day[:sunset]).to_datetime,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end
end
