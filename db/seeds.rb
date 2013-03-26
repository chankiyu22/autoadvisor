#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cmpsci = Major.create(:degree => "B.Sc", :dept => "CMPSCI", :name => "Computer Science")
econ = Major.create(:degree => "B.BA", :dept => "ECON", :name => "Economics")
acct = Major.create(:degree => "B.BA", :dept => "ACCT", :name => "Account")

time0 = TimeSlot.create(:beg_hour => 16, :beg_min => 0, :end_hour => 17, :end_min => 15, :days => "TuTh")
time1 = TimeSlot.create(:beg_hour => 11, :beg_min => 15, :end_hour => 12, :end_min => 5, :days => "MWF")

cmpsci320_L1 = Section.create(:instructor => "Yuriy Brun",
		:section_number => "01",
		:size => 40,
		:spire_id => 13680,
		:time_slot => time0,
		:class_number => 320,
		:class_string => "CMPSCI320",
		:dept => "CMPSCI",
		:description => nil,
		:name => "Software Engineering",
		:primary => true)

cmpsci326_L1 = Section.create(:class_number => 326,
		:class_string => "CMPSCI326",
		:dept => "CMPSCI",
		:description => nil,
		:name => "Web Programming",
		:primary => true,
		:instructor => "Tim",
		:section_number => "01",
		:size => 40,
		:spire_id => 12345,
		:time_slot => time1)

admin = User.new(:email => "autoadvisoraws@gmail.com", :password => "password", :password_confirmation => "password")
admin.admin = true
admin.confirmed_at = DateTime.now
admin.majors << cmpsci
admin.majors << econ
admin.majors << acct
admin.sections << cmpsci320_L1
admin.sections << cmpsci326_L1
admin.credits << Credit.new(:name => "autoadvisor",
                            :year => "2010",
                            :gpa => 2.65,
                            :dept => "Computer Science",
                            :number => "20087367")
admin.past_courses << PastCourse.new(:year => "2010",
                                     :course_code => "CMPSCI100",
                                     :course_name => "My Course Name",
                                     :grade => "A")
admin.past_courses << PastCourse.new(:year => "2010",
                                     :course_code => "CMPSCI120",
                                     :course_name => "I Dont Know",
                                     :grade => "B+")
admin.past_courses << PastCourse.new(:year => "2011",
                                     :course_code => "ECON103",
                                     :course_name => "Microeconomics",
                                     :grade => "A-")
admin.save

user0 = User.create(:email => "test@gmail.com", :password => "password", :password_confirmation => "password")
user0.admin = false
user0.confirmed_at = DateTime.now
user0.majors << econ
user0.save
