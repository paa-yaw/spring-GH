# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@array = ["derek@workforce.com", "blessing@workforce.com", "laud@workforce.com", "afi@workforce.com"]

@array.each do |email|
	unless Client.exists?(email: email)
		Client.create!(email: email, password: "workforce", admin: true)
	end
end