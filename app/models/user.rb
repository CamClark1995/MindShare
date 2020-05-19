class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username
  validate :validate_password

  def validate_password
    errors.add(:password, 'must be at least 8 characters') unless password.length >= 8
    unless password.each_char.any? { |char| ('A'..'Z').cover?(char) }
      errors.add(:password, 'must contain at least one uppercase letter')
    end
    unless password.each_char.any? { |char| ('0'..'9').cover?(char) }
      errors.add(:password, 'must contain at least one number')
    end
  end
end
