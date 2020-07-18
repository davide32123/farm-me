class FarmersController < ApplicationController
  def index
    skip_policy_scope
    @baskets = Basket.where(user: current_user)
    @subscriptions = @baskets.flat_map(&:subscriptions)
    redirect_to subscriptions_path if @baskets.count.zero?
    authorize @baskets
    authorize @subscriptions if @subscriptions.nil?
  end
end
