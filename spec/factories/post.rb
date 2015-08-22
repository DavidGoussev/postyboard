FactoryGirl.define do
  factory :post do
    title "post title!!!!!"
    body "Post bodies must be of varying length."
    user
    topic { Topic.create(name: 'Topic Name') }
  end
end
