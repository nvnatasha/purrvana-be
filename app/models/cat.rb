class Cat < ApplicationRecord
    has_many :user_cats
    has_many :users, through: :user_cats
    has_many :sessions

    validates :name, presence: true
    validates :mood, presence: true
    validates :purr_style, presence: true
    validates :img_url, presence: true
end