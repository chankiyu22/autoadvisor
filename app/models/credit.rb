class Credit < ActiveRecord::Base
  attr_accessible :dept, :gpa, :name, :number, :year

  has_one :user
end
