class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
