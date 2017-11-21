require 'faker'

5.times do
  User.create(name: Faker::Name.name, password: 'password')
end