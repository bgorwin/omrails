Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "signin", to: 'devise/sessions#new'
    delete "signout", to: 'devise/sessions#destroy'
    get "signup", to: 'devise/registration#new'
  end

  get 'feed', to: 'feed#show'

  # get 'users/:username', to: 'users#show', as: 'user'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end
  resources :tweets

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tweet', to: 'pages#tweets'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
