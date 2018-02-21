Rails.application.routes.draw do
  root to: 'votes#new'
  devise_for :users
  resources :votes do
    collection do
      get :wallet
    end
  end

  namespace :admin do
    resource :voting, only: [:new, :create]
  end
end
