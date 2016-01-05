Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new, :index]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :goals, except: [:new, :index]
end
