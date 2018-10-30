Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  
  root to: "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :plays

  resources :users, only: [:new, :create, :edit, :update, :show]  do
    resources :playbooks
    resources :plays
  end

  resources :playbooks, only: [:new, :create, :show]  do
    resources :plays
  end


end
