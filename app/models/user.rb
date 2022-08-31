class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates(:name, presence: true)
    validates(:email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 255 }, allow_blank: false)
    has_secure_password
    validates(:password, presence: true, length: { minimum: 6 }, allow_nil: false)
end
