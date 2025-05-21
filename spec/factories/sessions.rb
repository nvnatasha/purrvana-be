FactoryBot.define do
    factory :session do
      user
      cat
      duration_seconds { 300 }
      started_at { Time.now - 1.day }
      ended_at { started_at + duration_seconds.seconds }
  
    trait :natasha_kylo do
        association :user, factory: [:user, :natasha]
        association :cat, factory: [:cat, :kylo]
        duration_seconds { 300 }
        started_at { Time.now - 2.days }
        ended_at { started_at + 5.minutes }
    end
  
    trait :natasha_stormy do
        association :user, factory: [:user, :natasha]
        association :cat, factory: [:cat, :stormy]
        duration_seconds { 180 }
        started_at { Time.now - 1.day }
        ended_at { started_at + 3.minutes }
    end
  
    trait :chrissy_toulouse do
        association :user, factory: [:user, :chrissy]
        association :cat, factory: [:cat, :toulouse]
        duration_seconds { 420 }
        started_at { Time.now - 4.hours }
        ended_at { started_at + 7.minutes }
    end
    end
end