Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#welcome'

  get '/users/:id/profile', to: 'users#show'

  resources :users do
    resources :tickets
  end
  resources :users do
    resources :responses
  end
  
  resources :tickets
  resources :responses
end
