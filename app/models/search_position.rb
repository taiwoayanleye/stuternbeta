class SearchPosition < ActiveRecord::Base
	def positions
		@job_postings ||= find_job_postings
	end

	def find_products
		job_postings = JobPosting.all
		job_postings = job_postings.where(industry_id: industry_id) if industry_id.present?
		job_postings = job_postings.where(job_function_id: job_function_id) if job_function_id.present?
		job_postings = job_postings.where(location_id: location_id) if location_id.present?
		job_postings
	end
end
