require 'rails_helper'

describe 'Create session' do
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }
  before do
    user_params = {
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers
  end

  it 'creates a session' do
    user_params = {
      email: 'test@test.com',
      password: '12345'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to be_successful

    sesh = JSON.parse(response.body, symbolize_names: true)

    expect(sesh).to be_a Hash
    expect(sesh[:data]).to be_a Hash
    expect(sesh[:data][:type]).to eq('users')
    expect(sesh[:data][:attributes]).to be_a Hash
    expect(sesh[:data][:attributes].length).to eq(2)
    expect(sesh[:data][:attributes]).to include(:email, :api_key)
  end

  it 'fails if wrong password' do
    user_params = {
      email: 'test@test.com',
      password: '1'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to have_http_status(401)
  end

  it 'fails if no password' do
    user_params = {
      email: 'test@test.com'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to have_http_status(401)
  end

  it 'fails if no email' do
    user_params = {
      password: '12345'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to have_http_status(401)
  end

  it 'fails if invalid email' do
    user_params = {
      email: 'test test.com',
      password: '12345'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to have_http_status(401)
  end

  it 'fails if no password' do
    user_params = {
      email: 'test@test.com'
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to have_http_status(401)
  end
end
