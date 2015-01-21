class JobPosting < ActiveRecord::Base
	#ASSOCIATIONS HERE
	belongs_to :company_profile
	has_many :job_applications
	
	def self.search_for(query)
		where('position LIKE :query or job_description LIKE :query or job_requirements LIKE :query', query: "%#{query}%" )
	end

	# Set pagination limit
	# paginates_per 9

	#VALIDATIONS HERE
	validate :validate_end_date_before_start_date
	def validate_end_date_before_start_date
	  errors.add(:job_end, "must be greater than Start Date.") if job_end < job_start
	end

	validates :position_time, :job_paid, :position,
	        :length => { :minimum => 1,
	                     :message => "This field cannot be empty" }
	validates :job_description, :job_requirements,
	        :length => { :maximum => 300,
	                     :message => "Over 300 characters" }
end
