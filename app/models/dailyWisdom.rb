class DailyWisdom < ApplicationRecord
    validates :quote, presence: true
end