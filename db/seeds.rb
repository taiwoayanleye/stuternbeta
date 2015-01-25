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