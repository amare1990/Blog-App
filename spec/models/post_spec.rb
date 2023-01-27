require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.create(id: 1, title: 'Meeting Announcement',
                text: 'The monthly meeting of Microver micronauts will be held on today morning',
                author_id: 1)
  end

  before { subject.save }

  describe " model validation: \n" do
    it 'The comments_counter should be a whole number' do
      subject.comments_counter = -10
      expect(subject).to_not be_valid
    end

    it 'Again the likes_counter should not be a negative integer' do
      subject.comments_counter = -20
      expect(subject).to_not be_valid
    end

    it 'The title of the post shloul not be greater than 250 charactors' do
      subject.title = Random.rand(1..100) * 251
      expect(subject).to_not be_valid
    end

    it 'Right now the number of comments for this post should be zero  ' do
      expect(subject.comments_counter) == 0
    end

    it 'Right now the number of likes for this post should be zero  ' do
      expect(subject.likes_counter) == 0
    end

    it 'title value should not be null' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'text value should not be null' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'The `five_recent_comments` method should return the five latest comments' do
      7.times { Comment.create(text: 'Ok I will join it', author_id: 1, post_id: subject.id) }
      expect(subject.five_recent_comments.count) == 5
    end
  end
end
