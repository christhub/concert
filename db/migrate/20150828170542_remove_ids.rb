class RemoveIds < ActiveRecord::Migration
  def change
    remove_column(:bands, :venue_id, :int)
    remove_column(:venues, :band_id, :int)
  end
end
