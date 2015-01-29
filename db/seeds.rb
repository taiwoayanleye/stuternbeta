# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts "Importing schools..."
CSV.foreach(Rails.root.join("schools.csv"), headers: true) do |row|
	School.create! do |school|
		school.id = row[0]
		school.name = row[1]
	end
end
puts "...schools seeded"

puts "Importing locations..."
CSV.foreach(Rails.root.join("locations.csv"), headers: true) do |row|
	Location.create! do |location|
		location.id = row[0]
		location.name = row[1]
	end
end
puts "...locations seeded"

puts "Importing job functions..."
CSV.foreach(Rails.root.join("job_functions.csv"), headers: true) do |row|
	JobFunction.create! do |job_function|
		job_function.id = row[0]
		job_function.name = row[1]
	end
puts "...job functions seeded"

puts"Importing industries..."
CSV.foreach(Rails.root.join("industries.csv"), headers: true) do |row|
	Industry.create! do |industry|
		industry.id = row[0]
		industry.name = row[1]
	end
end
puts"...industries seeded"