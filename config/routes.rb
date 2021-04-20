Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :users, only: %i[edit update show]
  resources :topics do
    resources :comments, only: %i[create destroy]
    collection do
      get 'about'
    end
  end
end
