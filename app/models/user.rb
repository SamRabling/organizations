class User < ActiveRecord::Base
  has_many :organizations, dependent: :destroy
  has_many :attendees
  has_many :memberships, through: :members, source: :organizations
  has_secure_password

  before_validation :email_lowercase
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 8}

  private
    def email_lowercase
      self.email.downcase!
    end
end
