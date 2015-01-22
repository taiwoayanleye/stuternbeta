class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :school_year
      t.integer :major

      t.timestamps
    end
  end
end
