class FarmersController < ApplicationController
  def index
    @subscriptions = Subscription.where(user_id: current_user)
    @baskets = Basket.where(user_id: current_user)
    redirect_to root_path if @baskets.count.zero?
    authorize @baskets
    authorize @subscriptions
    skip_policy_scope
  end
end
