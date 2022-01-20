require 'rails_helper'

describe 'Forecast API', :vcr do
  it 'pulls the forecast for the location' do
    get '/api/v1/forecast?location=chandler,az'

    expect(response).to be_successful

    fc = JSON.parse(response.body, symbolize_names:true)

    expect(fc[:data]).to be_a Hash
    expect(fc[:id]).to be nil
    expect(fc[:data][:type]).to eq('forecast')
    expect(fc[:data][:attributes]).to be_a Hash

    expect(fc[:data][:attributes][:current_weather]).to be_a Hash
    expect(fc[:data][:attributes][:current_weather].length).to eq(10)
    expect(fc[:data][:attributes][:current_weather]).to include(:datetime, :sunrise, :sunset, :temp, :feels_like, :humidity, :visibility, :uvi, :conditions, :icon)

    expect(fc[:data][:attributes][:hourly_weather]).to be_an Array
    expect(fc[:data][:attributes][:hourly_weather].length).to eq(8)
    expect(fc[:data][:attributes][:hourly_weather].first).to be_a Hash
    expect(fc[:data][:attributes][:hourly_weather].first.length).to eq(4)
    expect(fc[:data][:attributes][:hourly_weather].first).to include(:datetime, :temp, :conditions, :icon)

    expect(fc[:data][:attributes][:daily_weather]).to be_an Array
    expect(fc[:data][:attributes][:daily_weather].length).to eq(5)
    expect(fc[:data][:attributes][:daily_weather].first).to be_a Hash
    expect(fc[:data][:attributes][:daily_weather].first.length).to eq(7)
    expect(fc[:data][:attributes][:daily_weather].first).to include(:datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)
  end
end
