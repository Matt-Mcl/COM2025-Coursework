class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.belongs_to :carpark, index: true, foreign_key: true, null: false
      t.integer :space_number, null: false
      t.decimal :hourly_cost, null: false

      t.timestamps
    end
  end
end
