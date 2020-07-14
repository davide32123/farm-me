class BasketsController < ApplicationController
  before_action :find_basket, only: [:show]

  def new
    @basket = Basket.new
    authorize @basket
  end

  def create
    params[:availability] = true
    @basket = current_user.baskets.new(basket_params)
    authorize @basket

    if @basket.save
      redirect_to basket_path(@basket)
    else
      render :new
    end
  end

  def show
    authorize @basket
  end

  private

  def find_basket
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:description, :user_id, :availability, :title, :price)
  end
end
