Rails.application.routes.draw do
  root "articles#index"
  resources :articles, only: [:index]
  resources :searches, only: [:index] do
    collection do
      get 'user_history'
    end
  end
end
