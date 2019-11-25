Rails.application.routes.draw do
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
  resources :categories, only: [:index]
  resources :relationships, only: [:create, :destroy]
  namespace :admin do
    get '/home', to: 'users#home'
    resources :users, only: [:index, :update, :destroy]
    resources :categories, only: [:index, :new, :edit, :create, :update, :destroy] do
        resources :words
    end
  end
  resources :lessons , only: [:create, :show] do
    resources :answers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
