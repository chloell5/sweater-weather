class Api::V1::BackgroundsController < ApplicationController
  def index
    bg = BackgroundFacade.get_image(params[:location])
    render json: BackgroundSerializer.new(bg)
  end
end
