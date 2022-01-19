require 'rails_helper'

RSpec.describe Background, :vcr do
  it 'has attributes' do
    bg = BackgroundService.image_data('chandler,az')
    bg_obj = Background.new(bg)

    expect(bg_obj).to be_a Background
    expect(bg_obj.description).to be_a String
    expect(bg_obj.url).to be_a String
    expect(bg_obj.name).to be_a String
    expect(bg_obj.owner_page).to be_a String
  end
end
