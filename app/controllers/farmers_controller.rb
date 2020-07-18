class FarmersController < ApplicationController
  def index
    @baskets = Basket.where(user: current_user)
    @subscriptions = @baskets.flat_map do |basket|
      basket.subscriptions
    end
    redirect_to root_path if @baskets.count.zero?
    authorize @subscriptions
    authorize @baskets
    skip_policy_scope
  end
end
