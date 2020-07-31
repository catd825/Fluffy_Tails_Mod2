class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :pets, dependent: :destroy

  validates :phone, length: { is: 10 }

end
