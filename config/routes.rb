Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'farmers#index'
  resources :baskets do
    resources :subscriptions, only: [:create]
    resources :basket_items, only: [:new, :create]
  end

  resources :subscriptions, only: [:index, :create, :update]
end
