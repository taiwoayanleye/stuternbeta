class AddJobFunctionToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :job_function_id, :integer
  end
end
