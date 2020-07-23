class Basket < ApplicationRecord
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :basket_items, dependent: :destroy
  has_many :products, through: :basket_items
  has_many_attached :photos
  validates :user_id, :price, :title, :availability, :description, presence: true
  validates :title, uniqueness: { scope: :description }

  def make_available!
    self.availability = true
  end

include PgSearch::Model
    pg_search_scope :search_by_products,
      associated_against: {
        products: [:name]
      },
      using: {
        tsearch: { prefix: true }
      }
end
