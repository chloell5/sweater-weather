class Api::V1::BookSearchController < ApplicationController
  def index
    list = BookFacade.get_info(params[:location])
    list.books.pop(list.books.length - (params[:quantity].to_i))
    render json: BooksSerializer.new(list)
  end
end
