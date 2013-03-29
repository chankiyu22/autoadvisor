class UploadsController < ApplicationController

	#Upload a transcirpt and render the filename. 
	def upload_transcript
		usernow = User.find(session[:'warden.user.user.key'][1][0])
		@transcript_file = params[:file]
		if(!@transcript_file.blank?)
			#result = system("path/to/parse.sh #{@transcript_file}")
			#just for now print out the filename...
			render :text => "uploaded "+@transcript_file
		else
			#there was nothing to upload
			redirect_to :action => 'transcript', :controller => 'pages'
		end
	end

	#Upload an individual course then redirect back to the transcript
	#page. New course should be visible. does not check
	def upload_course
		usernow = User.find(session[:'warden.user.user.key'][1][0])
		year = params[:year]
		courseName = params[:courseName]
		courseCode = params[:courseCode]
		grade = params[:grade]
		usernow.past_courses << PastCourse.new(:year => year, :course_name => courseName, :course_code => courseCode, :grade => grade)
		redirect_to :action =>'transcript', :controller => 'pages'
	end
end
