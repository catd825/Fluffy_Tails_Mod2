class Pet < ApplicationRecord
  belongs_to :location
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
