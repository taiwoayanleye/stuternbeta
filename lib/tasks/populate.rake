namespace :db do
	desc "Create students and employers profile"
	task :populate => :environment do
		require 'populator'
		require 'faker'
			StudentProfile.populate 100 do |s|
				s.first_name = Faker::Name.first_name
				s.last_name = Faker::Name.last_name
				s.school = Faker::Company.name
				s.expected_graduation = Faker::Business.credit_card_expiry_date
				s.school_year = 	Faker::Lorem.word
				s.last_completed_degree = Faker::Commerce.department
				s.residential_address = Faker::Address.street_address
				s.major = Faker::Commerce.department
				s.brief_summary = Faker::Lorem.paragraph
				s.user_id = Faker::Number.digit
				# s.image = Faker::Avatar.image("my-own-slug", "50x50")
			end
			puts 'Student done'
			StudentProfile.all.each { |s| s.image = File.open(Dir.glob(File.join(Rails.root, 'studentimages', '*')).sample); s.save! }
			puts 'Student images done'

			CompanyProfile.populate 100 do |c|
				c.company_name = Faker::Company.name
				c.description = Faker::Company.catch_phrase
				c.company_type = Faker::Company.suffix
				c.number_of_employees = Faker::Number.number(3)
				c.website = Faker::Internet.url
				c.location = Faker::Address.city
				c.reg_code = Faker::Company.duns_number
				c.user_id = Faker::Number.digit
				# c.image = Faker::Company.logo
				# c.image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)

			end
			puts 'Company done'
			CompanyProfile.all.each { |c| c.image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample); c.save! }
			puts 'Other images done'

			JobPosting.populate 100 do |j|
				j.position = Faker::Name.title
				j.job_description = Faker::Lorem.paragraph
				j.job_start = Faker::Business.credit_card_expiry_date
				j.job_end = Faker::Business.credit_card_expiry_date
				j.posted_on = Faker::Business.credit_card_expiry_date
				j.position_time = Faker::Lorem.word
				j.job_paid = Faker::Lorem.word
				j.job_requirements = Faker::Lorem.sentence
				j.user_id = Faker::Number.digit
				j.company_profile_id = Faker::Number.digit
			end
			puts 'Job done'

			Skill.populate 100 do |sk|
				sk.description =  Faker::Lorem.word
				sk.user_id = Faker::Number.digit
				sk.student_profile_id = Faker::Number.digit
			end
			puts 'Skill done'

			StuWorkExperience.populate 100 do |sw|
				sw.company = Faker::Company.name
			    sw.position = Faker::Name.title
			    sw.start_date = Faker::Business.credit_card_expiry_date
			    sw.end_date = Faker::Business.credit_card_expiry_date
			    sw.description = Faker::Lorem.paragraph
			    sw.student_profile_id = Faker::Number.digit
			end
			puts 'Experience done'

			StuReference.populate 100 do |sr|
				sr.uid = Faker::Number.digit
				sr.name = Faker::Name.first_name
				sr.relationship = Faker::Name.prefix
				sr.phone = Faker::PhoneNumber.phone_number
				sr.email = Faker::Internet.email
				sr.student_profile_id = Faker::Number.digit
			end
			puts 'References done'

			StuInterest.populate 100 do |si|
				si.description = Faker::Hacker.adjective
				si.user_id = Faker::Number.digit
				si.student_profile_id = Faker::Number.digit
			end
			puts 'Interest done'

			StuCertification.populate 100 do |sc|
				sc.description = Faker::Hacker.adjective
				sc.user_id = Faker::Number.digit
				sc.student_profile_id = Faker::Number.digit
			end
			puts 'Certification done'

			JobApplication.populate 100 do |ja|
				ja.company_profile_id = Faker::Number.digit
				ja.student_profile_id = Faker::Number.digit
				ja.job_posting_id = Faker::Number.digit
			end
			puts 'Job application done'
			JobApplication.all.each { |ja| ja.cover_letter = File.open(Dir.glob(File.join(Rails.root, 'sampledocs', '*')).sample); ja.save! }
			puts 'Cover letter done'
	end
end