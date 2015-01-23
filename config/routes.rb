VndaCrm::Application.routes.draw do
  root to: 'shops#index'
  resources :shops
end
