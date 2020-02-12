class Tweet < ApplicationRecord
  belongs_to :user

  delegate :username, to: :user, prefix: false

  validates :content, presence: true, allow_blank: false

  scope :current, -> { where('created_at >= ?', Time.now - 90.days) }
end
