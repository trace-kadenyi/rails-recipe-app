class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
   @recipe = Recipe.find(params[:recipe_id])
   @recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    if @recipe_food.save
      flash.notice = "Food added to recipe"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      flash.notice = "Recipe food updated"
          redirect_to recipe_path(params[:recipe_id])

    else
      flash.alert = "Failed to update recipe food"
          redirect_to recipe_path(params[:recipe_id])

    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash.notice = "Food removed from recipe"
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
