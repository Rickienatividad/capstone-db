class CreateSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :length
      t.string :weight
      t.string :habits
      t.string :img

      t.timestamps
    end
  end
end
