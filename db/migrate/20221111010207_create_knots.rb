class CreateKnots < ActiveRecord::Migration[7.0]
  def change
    create_table :knots do |t|
      t.string :name
      t.string :img

      t.timestamps
    end
  end
end
