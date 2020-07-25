class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :baskets, dependent: :destroy
  has_many :subscriptions, dependent: :destroy #as a customer
  has_many :subscriptions_as_farmer, through: :baskets, source: :subscriptions
  has_one_attached :photo
  validates :email, uniqueness: true
  validates :encrypted_password, :email, presence: true
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
