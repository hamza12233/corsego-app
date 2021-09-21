class Lesson < ApplicationRecord
ATTRIBUTE_WHITELIST = [
  :title,
  :content,
  :course_id
].freeze

  belongs_to :course

  has_rich_text :content

  extend FriendlyId
  friendly_id :title, use: :slugged
end
