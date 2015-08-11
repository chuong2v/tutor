class TeachingTime < ActiveRecord::Base
  belongs_to :day_of_week, :foreign_key => :dow_id
  belongs_to :time_of_day, :foreign_key => :tod_id
  belongs_to :tutor_detail, :foreign_key => :td_id
end
