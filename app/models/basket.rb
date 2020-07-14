class Basket < ApplicationRecord
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :basket_items, dependent: :destroy
  validates :user_id, :price, :title, :availability, :description, presence: true
  validates :title, :description, uniqueness: true
end
