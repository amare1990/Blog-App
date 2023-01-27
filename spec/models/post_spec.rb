require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(id: 1, title: 'Meeting Announcement',
  text: "The monthly meeting of Microver micronauts will be held on today morning",
  author_id: 1) }

  before { subject.save }

  describe "Validation: \n" do

    it "Right now the post model created should be valid" do
      expect(subject).to be_valid
    end

    it "Right now the number of comments for this post should be zero  " do
      expect(subject.comments_counter) == 0
    end

    it "Right now the number of likes for this post should be zero  " do
      expect(subject.likes_counter) == 0
    end

    it "title value should not be null" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "text value should not be null" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "The `five_recent_comments` method should return the five latest comments" do
      7.times {Comment.create(text: "Ok I will join it", author_id: 1, post_id: subject.id)}
      expect(subject.five_recent_comments.count) == 5
    end

  end # end of inner describe block


end
