class AddDescriptiontoSpecies < ActiveRecord::Migration[7.0]
  def change
    add_column :species, :description, :text
  end
end
