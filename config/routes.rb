Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
    resources :foods
    resources :public_recipes
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]

    end

  root to: "public_recipes#index"
end
