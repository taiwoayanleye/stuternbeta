class Shortlisting < ActiveRecord::Base
	belongs_to :company_profile
	belongs_to :student_profile
end
