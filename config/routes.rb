Rails.application.routes.draw do
  root 'designs#index'
  devise_for :users

  resources :designs do
    resources :reviews, only: [:new, :create, :destroy]
  end
  #add ability to delete
  resources :users, only: [:show]

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end
end
