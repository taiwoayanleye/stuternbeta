class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :school_year
      t.string :major

      t.timestamps
    end
  end
end
