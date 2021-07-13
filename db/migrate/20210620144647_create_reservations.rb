class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :area
      t.string :keyword
      t.string :total_price
      t.string :total_prices
      t.date :begin_day
      t.date :finish_day
      t.integer :people
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
