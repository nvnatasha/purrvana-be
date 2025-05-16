# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Cat.destroy_all

cats = [
    {
      name: 'Duchess Marie',
      mood: 'Sleepy',
      purr_style: 'Gentle hum',
      img_url: 'https://media.giphy.com/media/XKfEhT0PHSzKMbUBZj/giphy.gif'
    },
    {
      name: 'Kylo',
      mood: 'Relaxed',
      purr_style: 'Low rumble',
      img_url: 'https://media.tenor.com/mGC7-NWoVZsAAAAi/siamese-cat.gif'
    },
    {
      name: 'Stormy',
      mood: 'Neutral',
      purr_style: 'Balanced wave',
      img_url: 'https://media.tenor.com/qaNo17mV6JcAAAAi/cute.gif'
    },
    {
      name: 'Toulouse',
      mood: 'Frisky',
      purr_style: 'Bouncy rhythm',
      img_url: 'https://media.tenor.com/jXWlf9y2i1IAAAAi/ginger-cat-cat.gif'
    },
    {
      name: 'Emmy',
      mood: 'Spicy',
      purr_style: 'Sharp vibrato',
      img_url: 'https://gifdb.com/images/high/scratch-pad-cartoon-tabby-cat-4lk0rv3hledc1la4.gif'
    },
    {
      name: 'Mr. Kato',
      mood: 'Cheerful',
      purr_style: 'Melodic trill',
      img_url: 'https://image.shutterstock.com/image-vector/vector-character-egyptian-mau-cat-kawaii-260nw-1344755234.jpg'
    }
  ]

cats.each do |cat|
  Cat.create!(cat)
end

puts "🌟 Seeded #{Cat.count} cat companions!"

User.destroy_all
Session.destroy_all
UserCat.destroy_all

user1 = User.create!(
  name: "Natasha",
  email: "natasha@example.com",
  password: "password"
)

user2 = User.create!(
  name: "Jason",
  email: "jason@example.com",
  password: "pokemon"
)

# Assign each user a couple cats
cat1 = Cat.find_by(name: "Kylo")
cat2 = Cat.find_by(name: "Stormy")
cat3 = Cat.find_by(name: "Toulouse")

# Connect users to cats via UserCats
UserCat.create!(user: user1, cat: cat1, times_used: 3)
UserCat.create!(user: user1, cat: cat2, times_used: 1)
UserCat.create!(user: user2, cat: cat3, times_used: 2)

# Create some sessions
Session.create!(user: user1, cat: cat1, duration_seconds: 300, started_at: Time.now - 2.days, ended_at: Time.now - 2.days + 5.minutes)
Session.create!(user: user1, cat: cat2, duration_seconds: 180, started_at: Time.now - 1.day, ended_at: Time.now - 1.day + 3.minutes)
Session.create!(user: user2, cat: cat3, duration_seconds: 420, started_at: Time.now - 4.hours, ended_at: Time.now - 4.hours + 7.minutes)

