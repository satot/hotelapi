class ApplicationController < ActionController::API
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application',
      content_type: 'application/json'
  end
end
