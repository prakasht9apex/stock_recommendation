Rails.application.routes.draw do
  devise_for :users
  root :to => "posts#index"

  resources :users, only: [:new, :create, :show] do
    resources :notifications,only: [:index, :show] do
      collection { get :mark_all_read }
    end
  end
  resources :posts, only: [:index, :new, :create, :show, :edit] do
    collection { get :my_posts }
    resources :comments
  end
end
