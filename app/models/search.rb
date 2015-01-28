class Search < ActiveRecord::Base
	# attr_accessor :student_profiles
	# validates_presence_of :school_year, :major

	def students
		@student_profiles ||= find_student_profiles
	end

private

	def find_student_profiles
		student_profiles = StudentProfile.all
		# student_profiles = student_profiles.where("first_name like ?", "%#{keywords}%") if keywords.present?
		student_profiles = student_profiles.where(school_year: school_year) if school_year.present?
		student_profiles = student_profiles.where(major: major) if major.present?
		student_profiles = student_profiles.where(expected_graduation: expected_graduation) if expected_graduation.present?
		student_profiles = student_profiles.where(school_id: school_id) if school_id.present?
		student_profiles = student_profiles.where(location_id: location_id) if location_id.present?			
		student_profiles
	end
end
