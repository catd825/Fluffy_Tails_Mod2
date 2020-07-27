class RemoveIdKeysFromPets < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :user_id
  end
end
