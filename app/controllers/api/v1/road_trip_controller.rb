class Api::V1::RoadTripController < ApplicationController
  before_action :validate_api_key

  def create
    rt = RoadTripFacade.road_trip(road_trip_params[:origin], road_trip_params[:destination])
    render json: RoadTripSerializer.new(rt)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def validate_api_key
    key = ApiKey.find_by(token: params[:api_key])
    if key.nil?
      render json: { error: '401: Unauthorized' }, status: 401
    end
  end
end
