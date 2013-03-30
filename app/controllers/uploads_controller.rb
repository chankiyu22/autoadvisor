class UploadsController < ApplicationController

	#Upload a transcirpt. if there is a file to upload temporaraly save it
	#in "public/uploadedTranscript", then delete it after parsing. if no 
	#file stay on same page.
	def upload_transcript
		usernow = User.find(session[:'warden.user.user.key'][1][0])
		if (!params[:file].blank?)
			transcriptFile =  params[:file].original_filename
    		directory = "public/uploadedTranscript"
    		path = File.join(directory, transcriptFile)
    		File.open(path, "wb") { |f| f.write(params[:file].read)}
    		#callParser("public/uploadedTranscript/"+transcriptFile)
    		File.delete("public/uploadedTranscript/"+transcriptFile)
    		redirect_to :action => 'transcript', :controller => 'pages'
    	else
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

	#Deletes the selected course information from the users records.
	def delete
		usernow = User.find(session[:'warden.user.user.key'][1][0])

		redirect_to :action=> 'transcript',:controller=>'pages'
		

	end

end
