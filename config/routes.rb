Rails.application.routes.draw do
  devise_for :users
  root :to => "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: [:show, :index] do
    resources :subscriptions, only: [:new, :create]
  #  resources :messages, only: :index
  #  resources :polls, only: [:new, :create, :index]
  #  collection do
  #    get :favorites
  #  end
  #  resources :favorites, only: [:create, :destroy]
  end
  resource :portfolio, only: :show
  resources :chatrooms, only: :show do
    resources :messages, only: [:create]
  end


  #GET	/quizzes/new(.:format)
  #POST	/quizzes(.:format)
  resources :quizzes, only: [:new, :create]
end
