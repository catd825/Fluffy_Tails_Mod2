class AddTypetoPet < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :type, :string
  end
end
