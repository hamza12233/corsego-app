class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :course, :user, presence: true

  validates_uniqueness_of :user_id, scope: :course_id #course can not enroled same user twice
  validates_uniqueness_of :course_id, scope: :user_id #user can not subscribed same course twice

  validate :cant_subscribe_to_own_course  #user cant create subscribtion if course.user = current.user

  protected
  
  def cant_subscribe_to_own_course
    if self.new_record?
      if self.user_id.present?
        if self.user_id == course.user_id
          errors.add(:base, "You can not subscribe to your own course")
        end
      end
    end
  end

end
