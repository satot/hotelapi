class ErrorsController < ActionController::Base
  rescue_from StandardError, with: :render_500
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::ParameterMissing, with: :render_400

  def render_500
    status = 500
    render json: { error: "Internal server error", status: status },
      status: status, content_type: 'application/json'
  end

  def render_400 exception
    status = 400
    render json: { error: exception.message, status: status },
      status: status, content_type: 'application/json'
  end

  def render_404
    status = 404
    render json: { error: "Not found", status: status },
      status: status, content_type: 'application/json'
  end

  def show
    raise request.env["action_dispatch.exception"]
  end
end
