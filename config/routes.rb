Rails.application.routes.draw do
  resources :flats, only: [:show, :index]
  get '/issues/recap'
  get '/deals/recap'
  resources :assignments, only: [:create, :destroy] do
    resources :issues, only: [:new, :create]
    resources :deals, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
