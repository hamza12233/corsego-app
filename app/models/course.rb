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

  has_rich_text :description

  scope :search_courses, ->(search) { where("title ILIKE ?", "%#{search}%") }

  extend FriendlyId
  friendly_id :title, use: :slugged

end
