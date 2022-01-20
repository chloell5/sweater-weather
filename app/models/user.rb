class User < ApplicationRecord
  has_many :api_keys, as: :bearer

  has_secure_password

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :password_confirmation, presence: { on: :create }
end
