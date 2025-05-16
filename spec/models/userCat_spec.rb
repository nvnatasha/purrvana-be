require 'rails_helper'

RSpec.describe UserCat, type: :model do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:cat_id) }
    it { should validate_numericality_of(:times_used).is_greater_than_or_equal_to(0) }

    it { should belong_to(:user) }
    it { should belong_to(:cat) }
end