class Section < ActiveRecord::Base
  attr_accessible :class_number, :class_string, :dept, :description, :instructor, :name, :primary?, :section_number, :size, :spire_id
end
