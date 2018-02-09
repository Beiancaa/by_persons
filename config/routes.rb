Rails.application.routes.draw do
  
  resources :people   
  root "people#index"
   
  resources :addresses
  resources :profiles
  
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
end
