class Api::V1::ForecastController < ApplicationController
  def index
    fc = ForecastFacade.forecast(params[:location])
    render json: ForecastSerializer.new(fc)
  end
end
