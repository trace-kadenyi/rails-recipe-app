class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @show_list = []
  end

  def filter
    @filtered_foods = []
    @filtered_foods.push(@foods - @recipe.foods)
    puts @filtered_foods
  end
  
  
end
