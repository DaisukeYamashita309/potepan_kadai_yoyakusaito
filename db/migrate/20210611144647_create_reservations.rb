class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :area
      t.string :keyword

      t.timestamps
    end
  end
end
