class AddImgurlToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :img_url, :string
  end
end
