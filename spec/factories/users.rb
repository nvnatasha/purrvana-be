FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "user#{n}@example.com" }
        password { "password" }

    trait :natasha do
        name { "Natasha" }
        email { "natasha@example.com" }
    end

    trait :chrissy do
        name { "Chrissy" }
        email { "chrissy@example.com" }
        password { "pokemon" }
    end
  end
end