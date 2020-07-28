class Location < ApplicationRecord

  has_many :pets, dependent: :destroy

  validates :phone, length: { is: 10 }

end
