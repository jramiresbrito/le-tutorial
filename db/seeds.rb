puts 'Deleting data if exist'

User.destroy_all

puts 'Creating user...'
User.create(
  name: 'João Victor Ramires Guimarães Brito',
  email: 'joaoramires.engsoft@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

puts 'done!'
