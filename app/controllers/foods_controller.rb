class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods.order(created_at: :desc)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path,
        notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])

    if @food.destroy
      flash.notice = 'Food was successfully deleted.'
    else
      flash.alert = 'Food was not deleted.'
    end
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
