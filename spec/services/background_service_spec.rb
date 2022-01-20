require 'rails_helper'

RSpec.describe BackgroundService, :vcr do
  it 'returns image data for location' do
    bg = BackgroundService.image_data('chandler,az')

    expect(bg).to be_a Hash
    expect(bg[:urls][:raw]).to be_a String
    expect(bg[:user][:name]).to be_a String
    expect(bg[:user][:links][:self]).to be_a String
  end
end
