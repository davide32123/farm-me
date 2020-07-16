class BasketItemsController < ApplicationController
  def create
    @basket_item = BasketItem.new(basket_item_params)
    @basket = Basket.find(params[:basket_id])
    @basket_item.basket = @basket
    if @basket_item.save
      @basket_item = BasketItem.new
      redirect_to basket_path(@basket)
    else
      render './basket/show'
    end
  end

  private

  def basket_item_params
<<<<<<< HEAD
    params.require(:basket_item).permit(:basket_id, :product_id)
  end

=======
    params.require(:basket_item).permit(:description, :ingredient_id)
  end
>>>>>>> 4b171d1d1ea51970a6718f43ac51f917ed573d3a
end
