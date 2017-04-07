class User < ActiveRecord::Base
    has_many :posts
    has_many :messages
    has_many :messages, through: :posts
    has_many :owners
    has_many :blogs, through: :owners
    has_many :comments, as: :commentable, dependent: :destroy
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :email_address, presence: true, length: { minimum: 2 }
    validates :email_address, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
