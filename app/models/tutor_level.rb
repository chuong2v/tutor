class TutorLevel < ActiveRecord::Base
  belongs_to :level 
  belongs_to :tutor_detail, :foreign_key => :td_id
end
