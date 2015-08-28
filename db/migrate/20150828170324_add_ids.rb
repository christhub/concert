class AddIds < ActiveRecord::Migration
  def change
    add_column(:bands, :venue_id, :int)
    add_column(:venues, :band_id, :int)
  end
end
