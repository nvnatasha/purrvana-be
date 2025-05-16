require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_secure_password }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    # it ( should validate_uniqueness_of(:email).case_insensitive )

    it { should have_many(:sessions) }
    it { should have_many(:user_cats) }
    it { should have_many(:cats).through(:user_cats) }
end