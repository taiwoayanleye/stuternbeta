class Location < ActiveRecord::Base
	has_many :student_profiles
end
