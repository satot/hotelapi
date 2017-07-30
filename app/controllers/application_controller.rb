class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::ParameterMissing, with: :render_400

  def render_400
    # TODO
    # Responding error messages with the names of params required
    render nothing: true, status: 400, content_type: 'application/json'
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application',
      content_type: 'application/json'
  end
end
