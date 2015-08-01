# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

# #create test posts
# 50.times do
#   Post.create!(
#     title: Faker::Lorem.sentence,
#     body: Faker::Lorem.paragraph
#   )
# end
# posts = Post.all
#
# #create test commments
# 100.times do
#   Comment.create!(
#     post: posts.sample,
#     body: Faker::Lorem.paragraph
#   )
# end

50.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Commerce.price
  )
end

puts "Seed finished"
#puts "#{Post.count} posts created"
#puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
