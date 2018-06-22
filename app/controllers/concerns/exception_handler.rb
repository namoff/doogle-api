module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordInvalid do
      render json: {}, status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do
      render json: {}, status: :unprocessable_entity
    end

  end
end
