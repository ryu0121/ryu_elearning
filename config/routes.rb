Rails.application.routes.draw do
  namespace :admin do
    get 'words/index'
  end
  root 'staticpages#home'
  get '/about', to: 'staticpages#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  namespace :admin do
    get '/home', to: 'users#home'
    resources :users, only: [:index, :update, :destroy]
    resources :categories, only: [:index, :new, :edit, :create, :update, :destroy] do
        resources :words, only: [:index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
