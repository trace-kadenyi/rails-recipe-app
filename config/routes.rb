Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
   
    resources :foods do
      resources :recipe_foods
    end
    resources :public_recipes
    resources :shopping_list
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]

    end

  root to: "public_recipes#index"
end
