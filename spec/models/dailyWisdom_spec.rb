require 'rails_helper'

RSpec.describe DailyWisdom, type: :model do
    it { should validate_presence_of(:quote) }
end