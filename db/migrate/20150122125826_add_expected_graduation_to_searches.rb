class AddExpectedGraduationToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :expected_graduation, :string
    add_column :searches, :school_id, :integer
  end
end
