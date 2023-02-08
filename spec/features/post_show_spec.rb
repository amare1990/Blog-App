require 'rails_helper'
RSpec.describe 'post#how', type: :feature do
  before(:each) do
    @user = User.create(name: 'Amare', photo: 'My-photo', bio: 'Software Engineer')

    @user2 = User.create(name: 'Solomon', bio: 'Elec Engineer',
                         photo: 'sol-pic')

    @post = Post.create(
      title: 'Blog App dev',
      text: 'Class association in detail there',
      author_id: @user.id
    )

    Comment.create(text: 'Blog in rails is challenging', author_id: @user2.id, post_id: @post.id)
    Comment.create(text: 'Yet you will adapt to it Sol', author_id: @user.id, post_id: @post.id)
    Comment.create(text: 'Thanks', author_id: @user2.id, post_id: @post.id)
    Like.create(post_id: @post.id, author_id: @user2.id)
  end

  describe 'post#show test group' do
    it 'displays the post title' do
      visit user_posts_path(@user, @post.id)
      expect(page).to have_content('Class association in detail there')
    end

    it 'displays the post author' do
      visit user_posts_path(@user, @post.id)
      expect(page).to have_content('Amare')
    end

    it 'displays the comments counter' do
      visit user_posts_path(@user, @post.id)
      expect(page).to have_content('Comments: 3')
    end

    it 'displays the likes counter' do
      visit user_posts_path(@user, @post.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'displays the user name of each commentor' do
      visit user_posts_path(@user, @post.id)
      expect(page).to have_content('Amare')
    end

    it 'displays the user name of each commentor' do
      visit user_posts_path(@user, @post.id)
      expect(page).to_not have_content('Alebeachew')
    end

    it "The comments should contain 'Thanks!' text" do
      visit user_posts_path(@user, @post.id)
      expect(page).to have_content('Thanks')
    end

    it "The comments should not contain 'Hello' text" do
      visit user_posts_path(@user, @post.id)
      expect(page).to_not have_content('Hello')
    end
  end
end
