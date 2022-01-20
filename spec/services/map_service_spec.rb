require 'rails_helper'

RSpec.describe MapService, :vcr do
  it 'returns lat/long' do
    loc = MapService.get_location('Chandler, AZ')

    expect(loc).to be_a Hash
    expect(loc.size).to eq(2)
    expect(loc[:lat]).to be_a Float
    expect(loc[:lng]).to be_a Float
  end

  it 'returns trip' do
    trip = MapService.get_trip('Chandler, AZ', 'Flagstaff, AZ')

    expect(trip).to be_a Hash
    expect(trip.size).to eq(23)
  end
end
