class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  has_many :credits
  has_and_belongs_to_many :past_courses
  has_and_belongs_to_many :sections
  has_and_belongs_to_many :majors
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  
end
