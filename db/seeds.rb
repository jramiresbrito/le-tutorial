puts 'Creating users...'

User.create!(
  name: 'João Victor Ramires Guimarães Brito',
  email: 'joaoramires.engsoft@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
puts '1 - João created successfully.'

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)

  puts "#{n + 2} - #{name} created successfully."
end

puts 'done!'
