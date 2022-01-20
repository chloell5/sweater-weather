require 'rails_helper'

describe 'Background API', :vcr do
  it 'gets image data for the location' do
    get '/api/v1/backgrounds?location=chandler,az'

    expect(response).to be_successful

    bg = JSON.parse(response.body, symbolize_names: true)

    expect(bg).to be_a Hash
    expect(bg[:data]).to be_a Hash
    expect(bg[:data][:type]).to eq('background')
    expect(bg[:data][:attributes]).to be_a Hash
    expect(bg[:data][:attributes].length).to eq(4)
    expect(bg[:data][:attributes]).to include(:description, :url, :name, :owner_page)
  end
end
