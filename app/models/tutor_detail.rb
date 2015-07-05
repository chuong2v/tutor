class TutorDetail < ActiveRecord::Base
  belongs_to :subject
  belongs_to :level
  belongs_to :user
  has_many :teaching_times
  has_many :time_of_days, :through => :teaching_times
  has_many :day_of_weeks, :through => :teaching_times

  def self.search(subject_id, level_id, q, page)
    @tutor_details = TutorDetail.all
    @tutor_details = @tutor_details.where("id IN (SELECT cd_id FROM class_subjects WHERE subject_id=#{@subject_id})") if subject_id.present?
    @tutor_details = @tutor_details.where(level_id: level_id) if level_id.present?
    @tutor_details = @tutor_details.where("title LIKE '%#{q}%' OR description LIKE '%#{q}%' OR address LIKE '%#{q}%'") if q.present?
    @class_details = @class_details.order(updated_at: :desc)
    @class_details = @class_details.paginate(:page => page, :per_page  => 5)
  end
end
