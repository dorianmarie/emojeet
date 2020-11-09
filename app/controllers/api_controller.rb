class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: "Not found" }, status: :not_found
  end

  protected

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_current_user
    return if current_user
    render_error("You need to be logged in to do that")
  end

  def render_success
    render json: { success: true }
  end

  def render_error(message)
    render json: { message: message }, status: :bad_request
  end
end
