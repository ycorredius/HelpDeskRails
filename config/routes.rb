Rails.application.routes.draw do
  devise_for :users, controllers:{omniauth_callbacks:'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#welcome'

  get '/auth/:provider/callback', to: 'omniauth#create'

  resources :users do
    resources :tickets
  end

  resources :users do
    resources :responses
  end

  resources :tickets, only: [:index,:show]

  resources :tickets do
    resources :responses
  end

  post '/tickets/:id', to: 'tickets#resolved'
end
