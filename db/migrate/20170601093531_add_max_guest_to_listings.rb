class AddMaxGuestToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :max_num_guests, :integer
  end
end
