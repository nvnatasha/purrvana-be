require 'rails_helper'

RSpec.describe Cat, type: :model do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:mood) }
    it { should validate_presence_of(:purr_style) }
    it { should validate_presence_of(:img_url) }

    it { should have_many(:sessions) }
    it { should have_many(:user_cats) }
    it { should have_many(:users).through(:user_cats) }

end