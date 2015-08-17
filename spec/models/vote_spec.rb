require 'rails_helper'

describe Vote do
  include TestFactories
  include Devise::TestHelpers

  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        vote1 = Vote.new(value: 1)
        expect(vote1.valid?).to eq(true)

        vote2 = Vote.new(value: -1)
        expect(vote2.valid?).to eq(true)

        vote3 = Vote.new(value: 2)
        expect(vote3.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end

  def associated_post(options={})
    post_options = {
      title: 'Post Title!!!',
      body: 'Post bodies need to be  damn long!',
      topic: Topic.create(name: 'Topic name'),
      user: authenticated_user
    }.merge(options)

    Post.create(post_options)
  end



end
