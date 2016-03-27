5.times do
  User.create!(
  username: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  password: "password",
  password_confirmation: "password"
  )
end
users = User.all

10.times do
  Project.create!(
  title: Faker::Book.title,
  description: Faker::Hipster.paragraph,
  user: users.sample
  )
end
projects = Project.all

20.times do
  project = projects.sample

  Post.create!(
  title: Faker::Book.title,
  picture: nil,
  project: project,
  user: project.user
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Project.count} projects created"
puts "#{Post.count} posts created"
