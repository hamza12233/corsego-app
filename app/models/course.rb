class Course < ApplicationRecord
  ATTRIBUTE_WHITELIST = [
    :title,
    :description,
    :short_description,
    :level,
    :language,
    :price
  ].freeze
  validates :title, presence: true
  validates :description, presence: true, length:{ minimum: 5 }

  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :enrollments

  has_rich_text :description

  scope :search_courses, ->(search) { where("title ILIKE ?", "%#{search}%") }

  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_s
    title
  end

  def bought(user)
    self.enrollments.where(user_id: [user.id], course_id: [course.id].empty? )
  end

end
