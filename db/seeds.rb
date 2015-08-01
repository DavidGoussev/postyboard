# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

#create test posts
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

  # Post.create(
  #   title: "DPG unique title 2",
  #   body: "this is the most amazingly unique post body ever!"
  # )

  Post.where(
      title: "Unique Title!",
      body: "this is the most amazingly unique post body ever!"
    ).first_or_create


  Comment.where(
      post: Post.where(title: "Unique Title!"),
      body: "unique comment!"
    ).first_or_create

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
