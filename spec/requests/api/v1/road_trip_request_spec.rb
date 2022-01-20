require 'rails_helper'

RSpec.describe 'Roadtrip API', :vcr do
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  it 'pulls trip and weather info' do
    user_params = {
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers

    user_params = {
      email: 'test@test.com',
      password: '12345'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    sesh = JSON.parse(response.body, symbolize_names: true)

    trip_params = {
      origin: 'chandler,az',
      destination: 'flagstaff,az',
      api_key: sesh[:data][:attributes][:api_key]
    }

    post '/api/v1/road_trip', params: trip_params.to_json, headers: headers

    expect(response).to be_successful

    trip = JSON.parse(response.body, symbolize_names: true)

    expect(trip).to be_a Hash
    expect(trip[:data][:id]).to be nil
    expect(trip[:data][:attributes][:start_city]).to be_a String
    expect(trip[:data][:attributes][:start_city]).to eq('chandler,az')
    expect(trip[:data][:attributes][:end_city]).to be_a String
    expect(trip[:data][:attributes][:end_city]).to eq('flagstaff,az')
    expect(trip[:data][:attributes][:travel_time]).to be_a String
    expect(trip[:data][:attributes][:weather_at_eta]).to be_a Hash
    expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end

  it 'doesn\'t accept invalid API' do
    user_params = {
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers

    user_params = {
      email: 'test@test.com',
      password: '12345'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    trip_params = {
      origin: 'chandler,az',
      destination: 'flagstaff,az'
    }

    post '/api/v1/road_trip', params: trip_params.to_json, headers: headers

    expect(response).to have_http_status(401)
  end
end
