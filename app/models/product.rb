class Product < ApplicationRecord
  has_many :basket_items
  validates :name, presence: true, uniqueness: true
end
