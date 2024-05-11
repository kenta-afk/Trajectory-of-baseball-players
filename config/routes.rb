Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups
  resources :memberships
  resources :statuses


  resources :groups do
    resources :statuses
  end
  
 
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "top_page", to: "top_page#index"

  
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # root "posts#index"
end
