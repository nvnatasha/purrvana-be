class Session < ApplicationRecord
    belongs_to :user
    belongs_to :cat

    validates :duration_seconds, presence: true, numericality: { greater_than: 0 }
    validates :started_at, presence: true
end