require 'rails_helper'

RSpec.describe "Roadtrip API" do
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
binding.pry
    trip_params = {
      origin: 'chandler,az',
      destination: 'flagstaff,az',
      api_key: user[]
    }
  end
end
