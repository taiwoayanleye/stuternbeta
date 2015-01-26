class School < ActiveRecord::Base
	has_many :student_profiles
end
