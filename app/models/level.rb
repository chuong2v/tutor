class Level < ActiveRecord::Base
  has_many :tutor_details
  has_many :class_details
end
