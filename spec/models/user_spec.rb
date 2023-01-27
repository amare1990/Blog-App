require 'rails_helper'

RSpec.describe User, type: model do
  author { User.new(name: 'Amare', photo: 'photo.png', bio: 'Microverse student') }

  before {author.save}

  describe 'Validations' do

    it 'Author now should be valid' do
      expect(author).to be_valid
    end

    it 'name attribute value should be present' do
      author.name = nil

      expect(author).to_not be_valid
    end

    it "name attribute value should be exactly 'Amare' " do
      author.name = nil

      expect(author.name).to eq('Amare')
    end

    it 'photo attribute value should be present' do
      author.photo = nil
      expect(author).to_not be_valid
    end

    it 'bio attribute value should be present' do
      author.bio = nil
      expect(author).to_not be_valid
    end

    it 'post_counter befor the author posts should be zero' do
      author.posts_counter = 0
      expect(author).to be_valid
    end

    it 'The `three_recent_posts` method should return the three latest post' do
      Post.create(title: 'Job offer', text: 'Amare has got good job offer', author_id: author.id)
      Post.create(title: 'Job offer2', text: 'Amare has got good job offer 2', author_id: author.id)
      Post.create(title: 'Job offer 3', text: 'Amare has got good job offer 3', author_id: author.id)
      Post.create(title: 'Job offer 4', text: 'Amare has got good job offer 4', author_id: author.id)
      Post.create(title: 'Job offer 5', text: 'Amare has got good job offer 5', author_id: author.id)
      expect(author.three_recent_posts.count).to eq(3)
    end

  end # end of descriobe block

end
