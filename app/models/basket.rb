class Basket < ApplicationRecord
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :basket_items, dependent: :destroy
end
