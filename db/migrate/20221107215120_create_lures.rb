class CreateLures < ActiveRecord::Migration[7.0]
  def change
    create_table :lures do |t|
      t.integer :entry_id
      t.integer :user_id
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
