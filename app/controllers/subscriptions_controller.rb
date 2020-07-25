class SubscriptionsController < ApplicationController
  def index
    skip_policy_scope
    @subscriptions = Subscription.where(user: current_user)
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    @subscription.status = "pending"
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
    session[:return_to] ||= request.referer
    @subscription = Subscription.find(params[:id])
    authorize @subscription
    @subscription.update(subscription_params)
    @subscriptions = Subscription.where(user: current_user)
    redirect_to session.delete(:return_to)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status, :delivery_day, :user, :basket_id)
  end
end
