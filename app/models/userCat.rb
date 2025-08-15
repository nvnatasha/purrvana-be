class UserCat < ApplicationRecord
    belongs_to :user
    belongs_to :cat

    validates :user_id, presence: true
    validates :cat_id, presence: true
    validates :times_used, numericality: { greater_than_or_equal_to: 0 }

    def self.most_used_for(user)
        where(user: user)
          .includes(:cat)
          .order(times_used: :desc)
          .first
      end
      


    # def self.increment_usage_for(user, cat)
    #     user_cat = find_by(user: user, cat: cat)
    #     user_cat.increment!(:times_used) if user_cat
    # end

    def self.increment_usage_for(user, cat)
        return unless user && cat
      
        user_cat = find_or_create_by(user: user, cat: cat) do |uc|
          uc.times_used = 0
        end
      
        if user_cat.persisted?
          puts "✅ Found or created UserCat #{user_cat.id} - current times_used: #{user_cat.times_used}"
          user_cat.increment!(:times_used)
          puts "🔁 New times_used: #{user_cat.reload.times_used}"
        else
          puts "❌ Failed to create or find valid UserCat: #{user_cat.errors.full_messages}"
        end
      end
      
end      