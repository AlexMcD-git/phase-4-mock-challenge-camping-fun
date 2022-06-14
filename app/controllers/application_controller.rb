class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid

  private

  def invalid(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  def not_found(invalid)
      render json: { errors: invalid }, status: :not_found
  end

end
