class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.references :listing, index: true, foreign_key: true
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_internet
      t.boolean :is_smoker
      t.boolean :is_non_smoker

      t.timestamps
    end
  end
end
