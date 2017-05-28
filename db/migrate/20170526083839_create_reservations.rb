class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.string :when
      t.string :where
      t.integer :no_guest
      t.date :check_in
      t.date :check_out
      t.string :payment_mode
      t.boolean :payment_status

      t.timestamps
    end
  end
end
