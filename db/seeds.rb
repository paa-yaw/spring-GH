# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# @array = [["Derek Owusu-Frimpong", "derek@springgh.com"], ["Blessing Onomesino", "blessing@springgh.com"], ["Laud Bentil", "laud@springgh.com"], ["Afi Kwao", "ohui@springgh.com"]]

# @array.each do |fullname, email|
# 	unless Client.exists?(email: email)
# 		Client.create!(fullname: fullname, email: email, password: "workforce", admin: true)
# 	end
# end

Client.create(fullname: "Derek Owusu-Frimpong", email: "derek@springgh.com", password: "workforce",
		phone_number: "0204704427", location: "Accra")