class ChangeDataTypeForSubscriptionDeliveryDay < ActiveRecord::Migration[6.0]
  def change
    change_table :subscriptions do |t|
      t.change :delivery_day, :string
    end
  end
end
