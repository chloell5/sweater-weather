require 'rails_helper'

RSpec.describe RoadTrip, :vcr do
  it 'has attributes' do
    rt = RoadTrip.new({ start_city: 'chandler,az', end_city: 'flagstaff,az'})

    expect(rt).to be_a(RoadTrip)
    expect(rt.id).to be nil
    expect(rt.start_city).to eq('chandler,az')
    expect(rt.end_city).to eq('flagstaff,az')
  end
end
