class User < ApplicationRecord

  has_many :pets
  has_many :locations, through: :pets

end
