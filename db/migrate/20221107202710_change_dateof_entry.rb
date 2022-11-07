class ChangeDateofEntry < ActiveRecord::Migration[7.0]
  def change
    change_column :entries, :date, :datetime
  end
end
