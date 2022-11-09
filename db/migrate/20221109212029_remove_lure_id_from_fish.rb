class RemoveLureIdFromFish < ActiveRecord::Migration[7.0]
  def change
    remove_column :fish, :lure_id, :integer
  end
end
