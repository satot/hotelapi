Rails.application.routes.draw do
  resources :suppliers

  namespace :v1, defaults: {format: 'json'} do
    resources :search
  end

  # Handle 404
  get '*path', controller: 'application', action: 'render_404'
end
