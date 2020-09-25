puts 'Creating users...'

User.create!(
  admin: true,
  name: 'João Victor Ramires Guimarães Brito',
  email: 'joaoramires.engsoft@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  activated: true,
  activated_at: Time.zone.now
)
puts '1 - João created successfully.'

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

  puts "#{n + 2} - #{name} created successfully."
end

puts `clear`

puts 'Creating Microposts...'

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

puts `clear`

puts 'Creating relationships...'

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts 'done!'
