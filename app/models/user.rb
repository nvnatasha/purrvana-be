class User < ApplicationRecord
    has_secure_password

    has_many :user_cats
    has_many :cats, through: :user_cats
    has_many :sessions

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end