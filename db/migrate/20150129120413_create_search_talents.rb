class CreateSearchTalents < ActiveRecord::Migration
  def change
    create_table :search_talents do |t|
      t.string :school_year
      t.string :major
      t.string :expected_graduation
      t.integer :school_id
      t.integer :location_id

      t.timestamps
    end
  end
end
