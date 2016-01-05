Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new, :index, :edit]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :goals, only: [:create, :update, :show, :destroy]


end
