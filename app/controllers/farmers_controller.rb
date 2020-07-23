class FarmersController < ApplicationController
  def index
    skip_policy_scope
    @baskets = Basket.where(user: current_user)
    @subscriptions_as_farmer = @baskets.flat_map(&:subscriptions)
    @subscriptions_as_user = Subscription.where(user: current_user)
    redirect_to subscriptions_path if @baskets.count.zero?
    authorize @baskets
    authorize @subscriptions_as_farmer if @subscriptions_as_farmer.nil?
    authorize @subscriptions_as_user if @subscriptions_as_user.nil?
  end
end
