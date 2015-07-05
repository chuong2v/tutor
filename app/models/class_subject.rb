class ClassSubject < ActiveRecord::Base
  belongs_to :subject 
  belongs_to :class_detail
end
