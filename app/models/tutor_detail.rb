class TutorDetail < ActiveRecord::Base
  belongs_to :subject
  belongs_to :level
  belongs_to :user
  has_many :teaching_times
  has_many :time_of_days, :through => :teaching_times
  has_many :day_of_weeks, :through => :teaching_times

  def self.search(subject_id, level_id, q, page)
    @tutor_details = TutorDetail.all
    @tutor_details = @tutor_details.where("id IN (SELECT td_id FROM tutor_subjects WHERE subject_id=#{subject_id})") if subject_id.present?
    @tutor_details = @tutor_details.where("id IN (SELECT td_id FROM tutor_levels WHERE level_id=#{level_id})") if level_id.present?
    @tutor_details = @tutor_details.where("title LIKE '%#{q}%' OR description LIKE '%#{q}%' OR address LIKE '%#{q}%' OR (user_id IN (SELECT id FROM users WHERE username LIKE '%#{q}%'))") if q.present?
    @tutor_details = @tutor_details.order(updated_at: :desc) if @class_details.present?
    @tutor_details = @tutor_details.paginate(:page => page, :per_page  => 10) 
  end
end
