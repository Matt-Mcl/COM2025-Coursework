class CreateCarparks < ActiveRecord::Migration[5.2]
  def change
    create_table :carparks do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
