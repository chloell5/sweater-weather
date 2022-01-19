require 'rails_helper'

RSpec.describe BackgroundFacade, :vcr do
  it 'gets image data' do
    bg = BackgroundFacade.get_image('chandler,az')

    expect(bg).to be_a Background
    expect(bg.description).to be_a String
    expect(bg.url).to be_a String
    expect(bg.name).to be_a String
    expect(bg.owner_page).to be_a String
  end
end
