Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  resources :user_details
  resources :home
  root 'home#index'
  # get "*path" => redirect("/")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
