class PagesController < ApplicationController
  def main
  end

  def profile
    usernow = User.find(session[:'warden.user.user.key'][1][0])
    @email = usernow.email
    @majors = usernow.majors
    @course_taken = usernow.credits
    @credit
  end
end
