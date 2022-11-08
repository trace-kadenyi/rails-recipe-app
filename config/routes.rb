Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :foods
  end

  root "users#index"
end
