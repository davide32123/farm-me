class Basket < ApplicationRecord
  belongs_to :user
  has_many :subscriptions, dependent: :destroy
  has_many :basket_items, dependent: :destroy
  has_many_attached :photos
  validates :user_id, :price, :title, :availability, :description, presence: true
  validates :title, uniqueness: { scope: :description }

  accepts_nested_attributes_for :basket_items, allow_destroy: true, reject_if: :all_blank

  def make_available!
    self.availability = true
  end
end
