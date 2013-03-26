class Past_Course < ActiveRecord::Base
  attr_accessible :class, :year, :grade

  belongs_to :user
end
