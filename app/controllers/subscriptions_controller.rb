class SubscriptionsController < ApplicationController
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
