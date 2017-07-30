Rails.application.routes.draw do
  resources :suppliers, only: [:index, :show]

  namespace :v1, defaults: {format: 'json'} do
    resources :search, only: [:index]
  end
end
