Rails.application.routes.draw do
  get 'assignments/:assignment_id/issues/new', to: "issues#new",     as: "new_issue"
  post 'assignments/:assignment_id/issues',     to: "issues#create",  as: "create_issue"
  resources :flats, only: [:show, :index]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
