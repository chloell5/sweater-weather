require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  it 'gets coords' do
    loc = ForecastFacade.coords('chandler,az')

    expect(loc).to be_a Hash
    expect(loc.length).to eq(2)
    expect(loc[:lat]).to be_a Float
    expect(loc[:lng]).to be_a Float
    # Chandler, AZ sits at 33.3062° N, 111.8413° W
    expect(loc[:lat]).to be_between(33, 34).exclusive
    expect(loc[:lng]).to be_between(-112, -111).exclusive
  end

  it 'pulls forecast data from Service for Controller' do
    loc = ForecastFacade.forecast('chandler,az')

    expect(loc).to be_a Forecast
    expect(loc.id).to be nil
  end
end
