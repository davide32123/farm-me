class Product < ApplicationRecord
  has_many :basket_items
  validates :name, presence: true, uniqueness: true

  include PgSearch::Model
    pg_search_scope :search_by_products,
      against: [:name],
      using: {
        tsearch: { prefix: true }
      }
end
