Treebook::Application.routes.draw do


  devise_for :users

  #get 'index_friend', to:'user_friendships#index'
  
  #get 'new_friend/:friend_id', to:'user_friendships#new', as: :friendships
  get 'profiles/:friend_id', to:'profiles#show', as: :profile

  resources :statuses

  root 'statuses#index'

  resources :user_friendships do
    member do
      put :accept
    end
  end
  
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    delete 'logout', to: 'devise/sessions#destroy', as: :logout 
  end

end
