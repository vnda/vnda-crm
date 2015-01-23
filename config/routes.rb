VndaCrm::Application.routes.draw do
  root to: 'shops#index'
  resources :shops

  namespace :api, defaults: {format: 'json'} do
    match 'new_client', to: 'api#quote', via: [:get, :post], format: :json
  end
end
