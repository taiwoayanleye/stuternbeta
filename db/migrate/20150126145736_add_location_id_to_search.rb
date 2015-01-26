class AddLocationIdToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :location_id, :integer
  end
end
