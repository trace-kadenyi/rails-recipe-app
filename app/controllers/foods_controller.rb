class FoodsController < ApplicationController
  def index
    # show foods beloging to user with id = current_user.id
    @user = User.includes(:foods).find(params[:user_id])
    @foods = @user.foods
    # @current_user = current_user
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @user = User.find(params[:user_id])
    @food.user = @user

    if @food.save
      redirect_to user_foods_path
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

end
