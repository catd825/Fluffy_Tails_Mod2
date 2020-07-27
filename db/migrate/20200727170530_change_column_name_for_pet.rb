class ChangeColumnNameForPet < ActiveRecord::Migration[6.0]
  def change
    change_table :pets do |t|
      t.rename :type, :animal_type
    end
  end
end
