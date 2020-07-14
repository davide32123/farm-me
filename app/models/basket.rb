class Basket < ApplicationRecord
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :basket_items, dependent: :destroy
  has_many_attached :photos
  validates :user_id, :price, :title, :availability, :description, presence: true
  validates :title, uniqueness: { scope: :description }
end
