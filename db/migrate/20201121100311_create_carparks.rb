class CreateCarparks < ActiveRecord::Migration[5.2]
  def change
    create_table :carparks do |t|
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
