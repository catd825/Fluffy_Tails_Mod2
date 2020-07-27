class Pet < ApplicationRecord
  belongs_to :location
  has_many :favorites
  has_many :users, through: :favorites
end
