# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(:email => "autoadvisoraws@gmail.com", :password => "password", :password_confirmation => "password")
admin.admin = true
admin.confirmed_at = DateTime.now
admin.save

user0 = User.create(:email => "test@gmail.com", :password => "password", :password_confirmation => "password")
user0.admin = false
user0.confirmed_at = DateTime.now
user0.save
