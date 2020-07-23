class BasketsController < ApplicationController
  before_action :find_basket, only: [:show, :edit, :update]

  def new
    @basket = Basket.new
    authorize @basket
  end

  def index
    skip_policy_scope
    if params[:query].present?
      @baskets = Basket.search_by_products
      authorize @baskets
    else
      @baskets = Basket.all
      authorize @baskets
    end
  end

  def create
    @basket = current_user.baskets.new(basket_params)
    @basket.make_available!
    authorize @basket

    if @basket.save
      redirect_to basket_path(@basket)
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.new(user: current_user, basket: @basket)
    authorize @basket
    @basket_item = BasketItem.new
    authorize @basket_item
  end

  def edit
    authorize @basket
  end

  def update
    authorize @basket
    if @basket.update(basket_params)
      redirect_to basket_path(@basket)
    else
      render :new
    end
  end

  private

  def find_basket
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:description, :user_id, :availability, :title, :price, photos: [])
  end
end
