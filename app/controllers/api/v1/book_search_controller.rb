class Api::V1::BookSearchController < ApplicationController
  def index
    books = BookFacade.get_info(params[:location])
    # if params[:quantity].to_i > 0
    #   books.books.first(params[:quantity].to_i)
    # end
    render json: BooksSerializer.new(books)
  end
end
