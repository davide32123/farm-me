class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :baskets, dependent: :destroy
  has_many :subscriptions, dependent: :destroy #as a customer
  has_many :subscriptions_as_farmer, through: :baskets, source: :subscriptions
  validates :email, uniqueness: true
  validates :encrypted_password, :email, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
