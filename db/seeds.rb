# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

#create test posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

#create test commments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end



 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'dpg@sfglaw.com',
   password: 'helloworld'
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
