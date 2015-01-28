class CreateSearchPositions < ActiveRecord::Migration
  def change
    create_table :search_positions do |t|
      t.integer :location_id
      t.integer :industry_id
      t.integer :function_id

      t.timestamps
    end
  end
end
