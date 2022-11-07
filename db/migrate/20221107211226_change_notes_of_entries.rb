class ChangeNotesOfEntries < ActiveRecord::Migration[7.0]
  def change
    change_column :entries, :notes, :string
  end
end
