Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: :show do
    resources :subscriptions, only: [:new, :create]
  #  resources :messages, only: :index
  #  resources :polls, only: [:new, :create, :index]
  #  collection do
  #    get :favorites
  #  end
  #  resources :favorites, only: [:create, :destroy]
  end
  resource :portfolio, only: :show
  #resources :polls, only: [] do
  #  resources :responses, only: :create
  # end
end
