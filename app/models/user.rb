class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :baskets
  has_many :subscriptions #as a customer
  has_many :subscriptions_as_farmer, through: :baskets, source: :subscriptions
end
