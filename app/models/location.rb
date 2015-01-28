class Location < ActiveRecord::Base
	has_many :student_profiles
	has_many :company_profiles
end
