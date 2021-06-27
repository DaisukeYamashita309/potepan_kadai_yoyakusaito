class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      # t.BLOB :room_img
      t.string :room_name
      t.string :room_intro
      t.string :total_price
      t.date :begin_day
      t.date :finish_day
      t.datetime :reserve_day
      t.date :make_day
      t.string :one_day_money
      t.string :address
      t.integer :total_prices
      t.integer :people
      # t.index :user_id
      

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
