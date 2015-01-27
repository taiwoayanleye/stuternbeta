class CreateShortlistings < ActiveRecord::Migration
  def change
    create_table :shortlistings do |t|
      t.integer :company_profile_id
      t.integer :student_profile_id

      t.timestamps
    end
  end
end
