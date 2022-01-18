require 'rails_helper'

RSpec.describe Books, :vcr do
  it 'has attributes' do
    bs = BookFacade.get_info('denver')

    expect(bs).to be_a Books
    expect(bs.destination).to be_a String
    expect(bs.total_books_found).to be_an Integer
    expect(bs.books).to be_an Array
    expect(bs.books.first).to be_a Hash
  end
end
