class Section < ActiveRecord::Base
  attr_accessible :class_string, :instructor, :section_number, :size, :spire_id, :time_slot, :dept, :class_number, :class_string, :name, :description, :primary

  has_one :time_slot
  has_and_belongs_to_many :users
end
