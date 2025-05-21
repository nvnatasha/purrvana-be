FactoryBot.define do
  factory :cat do
    name { "Kylo" }
    mood { "Relaxed" }
    purr_style { "Low rumble" }
    img_url { "https://media.tenor.com/mGC7-NWoVZsAAAAi/siamese-cat.gif" }

    trait :duchess_marie do
      name { "Duchess Marie" }
      mood { "Sleepy" }
      purr_style { "Gentle hum" }
      img_url { "https://media.giphy.com/media/XKfEhT0PHSzKMbUBZj/giphy.gif" }
    end

    trait :stormy do
      name { "Stormy" }
      mood { "Neutral" }
      purr_style { "Balanced wave" }
      img_url { "https://media.tenor.com/qaNo17mV6JcAAAAi/cute.gif" }
    end

    trait :toulouse do
      name { "Toulouse" }
      mood { "Frisky" }
      purr_style { "Bouncy rhythm" }
      img_url { "https://media.tenor.com/jXWlf9y2i1IAAAAi/ginger-cat-cat.gif" }
    end

    trait :emmy do
      name { "Emmy" }
      mood { "Spicy" }
      purr_style { "Sharp vibrato" }
      img_url { "https://gifdb.com/images/high/scratch-pad-cartoon-tabby-cat-4lk0rv3hledc1la4.gif" }
    end

    trait :mr_kato do
      name { "Mr. Kato" }
      mood { "Cheerful" }
      purr_style { "Melodic trill" }
      img_url { "https://image.shutterstock.com/image-vector/vector-character-egyptian-mau-cat-kawaii-260nw-1344755234.jpg" }
    end
  end
end