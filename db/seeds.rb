# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@array = [["Derek Owusu-Frimpong", "derek@workforce.com"], ["Blessing Onomesino", "blessing@workforce.com"], ["Laud Bentil", "laud@workforce.com"], ["Afi Kwao", "afi@workforce.com"]]

@array.each do |fullname, email|
	unless Client.exists?(email: email)
		Client.create!(fullname: fullname, email: email, password: "workforce", admin: true)
	end
end