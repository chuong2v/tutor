class Subject < ActiveRecord::Base
  has_many :tutor_details
  has_many :class_subjects
  has_many :class_details, :through => :class_subjects
end
