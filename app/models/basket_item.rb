class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  # validates :basket_id, presence: true
  validates :product_id, presence: true
  validates :basket_id, uniqueness: { scope: :product_id }
  validates :quantity, numericality: { greater_than: 0 }
end
