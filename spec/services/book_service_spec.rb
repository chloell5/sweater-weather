require 'rails_helper'

RSpec.describe BookService, :vcr do
  it 'returns book data about location' do
    book = BookService.find_books('denver')

    expect(book).to be_a Hash
    expect(book.length).to eq(7)
    expect(book[:numFound]). to be_an Integer
    expect(book[:docs]).to be_an Array
    expect(book[:docs].first).to be_a Hash
  end
end
