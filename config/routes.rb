Rails.application.routes.draw do
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  root to: 'topics#index'
  resources :users, only: %i[edit update show]
  resources :topics do
    resources :comments, only: %i[create destroy]
    collection do
      get 'about'
      get 'search'
    end
  end
end
