5.times do
  User.create(
  username: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  password: "password",
  password_confirmation: "password"
  )
end
users = User.all

15.times do
  Post.create(
  title: Faker::Hipster.sentence(3),
  picture: "sample.jpg",
  user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
