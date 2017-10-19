require 'faker'
#
# 5.times do
#   User.create!(
#   name:     Faker::DragonBall.character,
#   email:    Faker::Internet.free_email,
#   password: Faker::Internet.password
#   )
# end
# users = User.all

# Create Wikis
15.times do
  Wiki.create!(
    title: Faker::RickAndMorty.quote,
    body:  Faker::Hipster.paragraphs(1)
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
