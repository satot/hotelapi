class ErrorsController < ActionController::Base
  rescue_from StandardError, with: :render_500
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::ParameterMissing, with: :render_400

  def render_500
    render_error 500, "Internal server error"
  end

  def render_400 exception
    render_error 400, exception.message
  end

  def render_404
    render_error 404, "Not found"
  end

  def show
    raise request.env["action_dispatch.exception"]
  end

  private
  def render_error status, message
    render json: { error: message, status: status },
      status: status, content_type: 'application/json'
  end
end
