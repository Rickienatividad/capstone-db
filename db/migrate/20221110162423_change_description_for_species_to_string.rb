class ChangeDescriptionForSpeciesToString < ActiveRecord::Migration[7.0]
  def change
    change_column :species, :description, :string
  end
end
