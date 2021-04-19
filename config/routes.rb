Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :users, only: [:edit, :update]
  resources :topics, only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'about'
    end
  end
end
