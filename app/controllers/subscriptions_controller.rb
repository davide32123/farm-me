class SubscriptionsController < ApplicationController
  def index
    skip_policy_scope
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    @subscription.status = "Pending"
    authorize @subscription

    if @subscription.save
      redirect_to subscriptions_path
    else
      @basket = Basket.find(@subscription.basket_id)
      render "/baskets/show"
    end
  end

  def update
    skip_policy_scope
    @subscription = Subscription.find(params[:id])
    authorize @subscription
    @subscription.update(subscription_params)
    redirect_to dashboard_path(current_user)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status, :delivery_day, :user, :basket_id)
  end
end
