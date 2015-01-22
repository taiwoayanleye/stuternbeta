class Search < ActiveRecord::Base
	def students
		@student_profiles ||= find_student_profiles
	end

private

	def find_student_profiles
		student_profiles = StudentProfile.order(:first_name)
		student_profiles = student_profiles.where("first_name like ?", "%#{keywords}%") if keywords.present?
		student_profiles = student_profiles.where(school_year: school_year) if school_year.present?
		student_profiles = student_profiles.where(major: major) if major.present?
		student_profiles
	end
end
