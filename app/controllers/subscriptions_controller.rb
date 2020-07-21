class SubscriptionsController < ApplicationController
  def index
    skip_policy_scope
    @subscriptions = Subscription.where(user: current_user)
  end

  def create; end

  def update
    skip_policy_scope
    @subscription = Subscription.find(params[:id])
    authorize @subscription
    @subscription.update(subscription_params)
    redirect_to dashboard_path(current_user)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status)
  end
end
