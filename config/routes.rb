Rails.application.routes.draw do
  #get 'properties/index'
  devise_for :users do
        
  end
  #get 'homepage', to: 'home#homepage'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homes#homepage'
  resources :homes do 
    collection do 
      get :dashboard
      get :homepage
    end
    member do 
    end
  end
  resources :bookings
  resources :properties
end

