FactoryBot.define do
    factory :user_cat do
      user
      cat
      times_used { 0 }
  
    trait :natasha_kylo do
        association :user, factory: [:user, :natasha]
        association :cat, factory: [:cat, :kylo]
        times_used { 3 }
    end
  
    trait :natasha_stormy do
        association :user, factory: [:user, :natasha]
        association :cat, factory: [:cat, :stormy]
        times_used { 1 }
    end
  
    trait :chrissy_toulouse do
        association :user, factory: [:user, :chrissy]
        association :cat, factory: [:cat, :toulouse]
        times_used { 2 }
    end
  end
end