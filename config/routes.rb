Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :users, only: [:edit, :update]
  resources :topics, only: [:index, :new, :create] do
    collection do
      get 'about'
    end
  end
end
