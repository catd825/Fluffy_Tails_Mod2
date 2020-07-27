class Location < ApplicationRecord

  has_many :pets, dependent: :destroy

end
