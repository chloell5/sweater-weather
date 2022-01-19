class Api::V1::RoadTripController < ApplicationController
  def create
    rt = RoadTripFacade.road_trip(road_trip_params[:origin], road_trip_params[:destination])
    render json: RoadTripSerializer.new(rt)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
