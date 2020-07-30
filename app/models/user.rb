class User < ApplicationRecord

  has_many :favorites
  has_many :pets, through: :favorites

  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
end
