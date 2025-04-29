class UserCat < ApplicationRecord
    belongs_to :user
    belongs_to :cat

    validates :user_id, presence: true
    validates :cat_id, presence: true
    validates :times_used, numericality: { greater_than_or_equal_to: 0 }
end