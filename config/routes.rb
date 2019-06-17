Rails.application.routes.draw do
  resources :flats, only: [:show, :index]
  resources :tasks, only: [:new, :create]
  get 'flats/:id/invite', as: :flat_invite, to: 'flats#invite'
  post 'flats/:id/invite', as: :flat_send_invite, to: 'flats#send_invite'
  get '/issues/recap', as: :issues_recap, to: 'issues#recap'
  patch '/assignments/:id', as: :issue_done, to: 'assignments#issue_done'
  get '/deals/recap'
  patch '/deals/:id', as: :update_deal, to: 'deals#update'
  resources :assignments, only: [:create, :destroy, :update] do
    resources :issues, only: [:new, :create]
    resources :deals, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
