class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :lure_id
      t.date :date
      t.string :location
      t.string :weather
      t.text :notes

      t.timestamps
    end
  end
end
