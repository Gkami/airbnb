class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :no_guest
      t.string :comment
      t.integer :total_price

      t.timestamps
    end
  end
end
