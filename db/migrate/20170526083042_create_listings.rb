class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :address1
      t.string :address2
      t.integer :postal_code
      t.string :state
      t.string :country
      t.integer :price
      t.string :room_type
      t.string :description
      t.date :availability
      t.integer :bedroom
      t.integer :bathroom

      t.timestamps
    end
  end
end
