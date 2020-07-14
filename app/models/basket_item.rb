class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  validates :basket_id, :product_id, presence: true
  validates :basket_id, uniqueness: { scope: :product_id }
end
