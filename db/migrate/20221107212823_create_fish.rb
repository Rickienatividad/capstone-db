class CreateFish < ActiveRecord::Migration[7.0]
  def change
    create_table :fish do |t|
      t.integer :entry_id
      t.integer :user_id
      t.integer :lure_id
      t.string :species
      t.integer :length
      t.integer :weight

      t.timestamps
    end
  end
end
