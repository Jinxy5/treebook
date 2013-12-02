Treebook::Application.routes.draw do
  get "profiles/show"
  devise_for :users
  resources :statuses
  root 'statuses#index'
  
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    delete 'logout', to: 'devise/sessions#destroy', as: :logout 
  end

end
