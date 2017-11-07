require 'faker'

5.times do
  User.create!(
  email:    Faker::Internet.free_email,
  password: Faker::Internet.password
  )
end
users = User.all

# Create Wikis (public)
15.times do
  Wiki.create!(
    title: Faker::RickAndMorty.quote,
    body:  Faker::Markdown.inline_code,
    user: users.sample
  )
end
wikis = Wiki.all

# Create Wikis (private)
15.times do
  Wiki.create!(
    title: Faker::StarWars.quote,
    body:  Faker::Hipster.paragraphs(1),
    user: users.sample,
    private: true
  )
end
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
