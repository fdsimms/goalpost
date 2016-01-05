Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new, :index]
    resources :user_comments, only: [:new]
  end
  resources :user_comments, only: [:edit, :update, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, except: [:new, :index] do
    resources :goal_comments, only: [:new]
  end
  resources :goal_comments, only: [:edit, :update, :create, :destroy]


end
