require 'rails_helper'

RSpec.describe Session, type: :model do
    it { should validate_presence_of(:duration_seconds) }
    it { should validate_numericality_of(:duration_seconds).is_greater_than(0) }
    it { should validate_presence_of(:started_at) }

    it { should belong_to(:user) }
    it { should belong_to(:cat) }
end