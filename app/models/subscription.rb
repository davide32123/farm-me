class Subscription < ApplicationRecord
  WEEKDAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].freeze
  belongs_to :user
  belongs_to :basket
  validates :basket_id, :user_id, :delivery_day, :status, presence: true
  validates :basket_id, uniqueness: { scope: :user_id }
  validates :delivery_day, :inclusion=> { :in => WEEKDAYS }

  def self.allowed_delivery_days
    WEEKDAYS
  end
end
