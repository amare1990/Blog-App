require 'rails_helper'

RSpec.describe Post, type: :model do
  post { Post.new(title: 'Meeting Announcement', text: "The monthly meeting of Microver micronauts will be held on today"),
author_id: 1 }


  before { post.save }

  describe "Post model validation" do

    it "Right now the post model created should be valid" do
      expect(post).to be_valid
    end

    it "Right now the number of comments for this post should be zero  " do
      expect(post.posts_counter).to eq(0)
    end

    it "Right now the number of likes for this post should be zero  " do
      expect(post.likes_counter).to eq(0)
    end

    it "title value should not be null" do
      post.title = nil
      expect(post).to_not be_valid
    end

    it "text value should not be null" do
      post.title = nil
      expect(post).to_not be_valid
    end

    it "The `five_recent_comments` method should return the five latest comments" do
      7.times {Comment.create(text: "Ok I will join it", author_id: 1, post_id:post.id)}
      expect(post.five_recent_comments.count).to eq(5)
    end

  end # end of describe block


end
