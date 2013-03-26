class UsersController < ApplicationController
  def show
    @user = user = User.find(params[:id])
    @email = user.email
    @majors = user.majors
    @courses = user.sections
    @credit = user.credits

  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
       log_in @user
       flash[:success] = "Welcome to Auto-Advisor!"
       redirect_to @user
    else
       render 'new'
    end
  end
end
