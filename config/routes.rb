Rails.application.routes.draw do
  resources :users do
    resources :foods
  end

  root "users#index"
end
