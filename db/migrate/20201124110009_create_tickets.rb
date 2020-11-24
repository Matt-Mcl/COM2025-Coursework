class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :space, index: true, foreign_key: true, null: false
      t.string :registration_number, null: false
      t.datetime :paid_from, null: false
      t.datetime :paid_to, null: false
      t.decimal :total_cost, null: false

      t.timestamps
    end
  end
end
