module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      render json: {}, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do
      render json: {}, status: :unprocessable_entity
    end
  end
end
