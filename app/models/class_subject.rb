class ClassSubject < ActiveRecord::Base
  belongs_to :subject 
  belongs_to :class_detail, :foreign_key => :cd_id
end
