class TutorSubject < ActiveRecord::Base
  belongs_to :subject 
  belongs_to :tutor_detail, :foreign_key => :td_id
end
