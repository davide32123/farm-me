class SubscriptionsController < ApplicationController
  def update
    @subscription = Subscription.find(params[:id])
    @subscription.update(subscription_params)
    redirect_to dashboard_path(current_user)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status)
  end
end
