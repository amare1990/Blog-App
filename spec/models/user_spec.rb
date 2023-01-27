require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(id: 1, name: 'Amare', photo: 'photo.png', bio: 'Microverse student') }

  before { subject.save }

  describe " model validations: \n" do
    it 'name attribute value should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "name attribute value should be exactly 'Amare' " do
      expect(subject.name) == 'Amare'
    end

    it 'photo attribute value should be present' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end

    it 'bio attribute value should be present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'post_counter should be a whole number' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'post_counter befor the author posts should be zero' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end

    it 'The three_recent_post method should return the three latest post and the count should be 3' do
      Post.create(title: 'Job offer', text: 'Amare has got good job offer', author_id: subject.id)
      Post.create(title: 'Job offer2', text: 'Amare has got good job offer 2', author_id: subject.id)
      Post.create(title: 'Job offer 3', text: 'Amare has got good job offer 3', author_id: subject.id)
      Post.create(title: 'Job offer 4', text: 'Amare has got good job offer 4', author_id: subject.id)
      Post.create(title: 'Job offer 5', text: 'Amare has got good job offer 5', author_id: subject.id)
      expect(subject.three_recent_posts.count) == 3
    end
  end
end
