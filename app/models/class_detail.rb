class ClassDetail < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :class_times
  has_many :time_of_days, :through => :class_times
  has_many :day_of_weeks, :through => :class_times
  has_many :class_subjects
  has_many :subject, :through => :class_subjects

  def self.search(subject_id, level_id, q, page)
    @class_details = ClassDetail.all
    @class_details = @class_details.where("id IN (SELECT cd_id FROM class_subjects WHERE subject_id=#{subject_id})") if subject_id.present?
    @class_details = @class_details.where(level_id: level_id) if level_id.present?
    @class_details = @class_details.where("title LIKE '%#{q}%' OR description LIKE '%#{q}%' OR address LIKE '%#{q}%' OR (user_id IN (SELECT id FROM users WHERE username LIKE '%#{q}%'))") if q.present?
    @class_details = @class_details.order(updated_at: :desc) if @class_details.present?
    @class_details = @class_details.paginate(:page => page, :per_page  => 10)
  end
end
