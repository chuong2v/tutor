class DayOfWeek < ActiveRecord::Base
  has_many :class_times
  has_many :teaching_times
  has_many :class_details, :through => :class_times
  has_many :tutor_details, :through => :teaching_times
end
