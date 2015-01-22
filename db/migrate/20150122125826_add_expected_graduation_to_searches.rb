class AddExpectedGraduationToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :expected_graduation, :string
    add_column :searches, :school, :string
  end
end
