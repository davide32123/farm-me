class FarmersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @subscriptions = Subscription.where(user_id: @user)
    @baskets = Basket.where(user_id: @user)
    redirect_to root_path if @baskets.count.zero?
  end
end
