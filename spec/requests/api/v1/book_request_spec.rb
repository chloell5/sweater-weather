require 'rails_helper'

describe 'Book API', :vcr do
  it 'gets a list of books for the location' do
    get '/api/v1/book-search?location=denver&quantity=5'

    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names:true)

    expect(books[:data]).to be_a Hash
    expect(books[:data][:id]).to eq(nil)
    expect(books[:data][:type]).to eq('books')
    expect(books[:data][:attributes]).to be_a Hash
    expect(books[:data][:attributes][:destination]).to be_a String
    expect(books[:data][:attributes][:forecast]).to be_a Hash
    expect(books[:data][:attributes][:forecast][:summary]).to be_a String
    expect(books[:data][:attributes][:forecast][:temperature]).to be_a String
    expect(books[:data][:attributes][:books]).to be_an Array
    expect(books[:data][:attributes][:books].first).to be_a Hash
    expect(books[:data][:attributes][:books].length).to eq(5)
  end
end
