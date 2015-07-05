class ClassTime < ActiveRecord::Base
  belongs_to :day_of_week
  belongs_to :time_of_day
  belongs_to :class_detail
end
