require 'rails_helper'

RSpec.describe ForecastService, :vcr do
  it 'returns locations weather data' do
    fc = ForecastService.loc_forecast({ lat: 33.0, lng: -112.0 })

    expect(fc).to be_a Hash
    expect(fc.size).to eq(7)
    expect(fc[:current]).to be_a Hash
    expect(fc[:hourly]).to be_an Array
    expect(fc[:hourly].first).to be_a Hash
    expect(fc[:daily]).to be_an Array
    expect(fc[:daily].first).to be_a Hash
  end
end
