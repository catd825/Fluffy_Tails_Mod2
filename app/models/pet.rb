class Pet < ApplicationRecord
  belongs_to :location
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :breed, presence: true
  validates :animal_type, presence: true
  validates :age, presence: true

  def self.search(search)
    if search
      pet = Pet.find_by(animal_type: search)
      if pet
        self.where(pet_id: pet)
      else
        Pet.all
      end
    else
      Pet.all
    end
  end

end
