Rails.application.routes.draw do
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  root to: 'topics#index'
  resources :users, only: %i[edit update show]
  resources :topics do
    collection do
      get 'all'
      get 'about'
      get 'search'
      get 'tagsearch'
    end
    resources :comments, only: %i[create destroy]
  end
  get '/tag/:id', to: 'topics#tag', as: 'tag'
end
