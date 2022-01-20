require 'rails_helper'

RSpec.describe RoadTripFacade, :vcr do
  it 'gets trip data' do
    trip = RoadTripFacade.road_trip('Chandler, AZ', 'Flagstaff, AZ')

    expect(trip).to be_a RoadTrip
    expect(trip.id).to be nil
    expect(trip.start_city).to be_a String
    expect(trip.end_city).to be_a String
    expect(trip.travel_time).to be_a String
    expect(trip.weather_at_eta).to be_a Hash
    expect(trip.weather_at_eta[:temperature]).to be_a Float
    expect(trip.weather_at_eta[:conditions]).to be_a String
  end
end
