module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message, errors: 'Could not validate email or password' }, status: 400
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message, errors: 'Invalid Credentials' }, status: 401
    end
  end
end
