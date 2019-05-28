Rails.application.routes.draw do
  get 'issues/new'
  get 'issues/create'
  resources :flats, only: [:show, :index]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
