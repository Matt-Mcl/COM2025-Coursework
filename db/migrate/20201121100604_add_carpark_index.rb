class AddCarparkIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :carparks, :name, unique: true
  end
end
