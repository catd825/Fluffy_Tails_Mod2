class Pet < ApplicationRecord
  belongs_to :location
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :breed, presence: true
  validates :animal_type, presence: true
  validates :age, presence: true



end
