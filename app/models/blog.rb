class Blog < ActiveRecord::Base
    has_many :owners
    has_many :posts
    has_many :messages, through: :posts
    has_many :users, through: :owners
    has_many :comments, as: :commentable, dependent: :destroy
    validates :name, :description, presence: true
end
