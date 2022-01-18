require 'rails_helper'

RSpec.describe Forecast, :vcr do
  it 'has attributes' do
    forecast = ForecastService.loc_forecast({ lat: 45.0, lng: 90.0})
    fc = Forecast.new(forecast)

    expect(fc.id).to be nil

    expect(fc.current_weather).to be_a Hash
    expect(fc.current_weather.size).to eq(10)
    expect(fc.current_weather[:datetime]).to be_a DateTime
    expect(fc.current_weather[:sunrise]).to be_a DateTime
    expect(fc.current_weather[:sunset]).to be_a DateTime
    expect(fc.current_weather[:temp]).to be_a Float
    expect(fc.current_weather[:feels_like]).to be_a Float
    expect(fc.current_weather[:humidity]).to be_an Integer
    expect(fc.current_weather[:visibility]).to be_an Integer
    expect(fc.current_weather[:uvi]).to be_an Integer
    expect(fc.current_weather[:conditions]).to be_a String
    expect(fc.current_weather[:icon]).to be_a String

    expect(fc.hourly_weather).to be_an Array
    expect(fc.hourly_weather.size).to eq(8)
    expect(fc.hourly_weather.first).to be_a Hash
    expect(fc.hourly_weather.first.size).to eq(4)
    expect(fc.hourly_weather.first[:datetime]).to be_a DateTime
    expect(fc.hourly_weather.first[:temp]).to be_a Float
    expect(fc.hourly_weather.first[:conditions]).to be_a String
    expect(fc.hourly_weather.first[:icon]).to be_a String

    expect(fc.daily_weather).to be_an Array
    expect(fc.daily_weather.size).to eq(5)
    expect(fc.daily_weather.first).to be_a Hash
    expect(fc.daily_weather.first.size).to eq(7)
    expect(fc.daily_weather.first[:datetime]).to be_a DateTime
    expect(fc.daily_weather.first[:sunrise]).to be_a DateTime
    expect(fc.daily_weather.first[:sunset]).to be_a DateTime
    expect(fc.daily_weather.first[:max_temp]).to be_a Float
    expect(fc.daily_weather.first[:min_temp]).to be_a Float
    expect(fc.daily_weather.first[:conditions]).to be_a String
    expect(fc.daily_weather.first[:icon]).to be_a String
  end
end
