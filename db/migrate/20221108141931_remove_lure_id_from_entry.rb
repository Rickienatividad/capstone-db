class RemoveLureIdFromEntry < ActiveRecord::Migration[7.0]
  def change
    remove_column :entries, :lure_id, :integer
  end
end
