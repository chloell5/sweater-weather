require 'rails_helper'

describe 'Create user' do
  it 'creates a user' do
    user_params = {
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    }

    post '/api/v1/users', params: user_params

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a Hash
    expect(user[:data]).to be_a Hash
    expect(user[:data][:type]).to eq('users')
    expect(user[:data][:attributes]).to be_a Hash
    expect(user[:data][:attributes].length).to eq(2)
    expect(user[:data][:attributes]).to include(:email, :api_keys)
  end

  it 'fails if passwords don\'t match' do
    user_params = {
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '1234'
    }

    post '/api/v1/users', params: user_params

    expect(response).to have_http_status(400)
  end

  it 'fails if email reused' do
    user_params = {
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    }

    post '/api/v1/users', params: user_params

    expect(response).to be_successful

    user_params = {
      email: 'test@test.com',
      password: '1111',
      password_confirmation: '1111'
    }

    post '/api/v1/users', params: user_params

    expect(response).to have_http_status(400)
  end
  it 'fails if no email' do
    user_params = {
      password: '12345',
      password_confirmation: '1234'
    }

    post '/api/v1/users', params: user_params

    expect(response).to have_http_status(400)
  end
  it 'fails if no password' do
    user_params = {
      email: 'test@test.com'
    }

    post '/api/v1/users', params: user_params

    expect(response).to have_http_status(400)
  end
end
