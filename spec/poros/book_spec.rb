require 'rails_helper'

RSpec.describe Book, :vcr do
  it 'has attributes' do
    bs = BookFacade.book_search('denver')
    book = bs.first

    expect(book.isbn).to be_an Array
    expect(book.title).to be_a String
    expect(book.publisher).to be_an Array
  end
end
