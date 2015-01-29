class CreateJobFunctions < ActiveRecord::Migration
  def change
    create_table :job_functions do |t|
      t.string :name

      t.timestamps
    end
  end
end
