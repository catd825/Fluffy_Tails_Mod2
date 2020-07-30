class AddColumnsToPet < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :img_url2, :string
    add_column :pets, :gender, :string
    add_column :pets, :description, :text
  end
end
