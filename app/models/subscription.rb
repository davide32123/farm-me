class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :basket
  validates :basket_id, :user_id, :delivery_day, :status, presence: true
  validates :basket_id, uniqueness: { scope: :user_id }
end
