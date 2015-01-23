VndaCrm::Application.routes.draw do
  root to: 'shops#index'
  resources :shops

  namespace 'api' do
    match 'new_madmimi_client', to: 'madmimi#new_client', via: [:get, :post]
  end
end
