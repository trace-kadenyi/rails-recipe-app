class ShoppingListController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end  
end
