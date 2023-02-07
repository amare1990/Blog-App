require 'rails_helper'

RSpec.describe 'Single User Page', type: :feature do
  before(:all) do
    @user = User.create(name: 'Amare', photo: 'my-photo', bio: 'Microverse student', posts_counter: 20)
    @post = Post.create(title: 'rails Integ testing', text: 'This is my first integration testing',
    comments_counter: 100, likes_counter: 10000, author: @user)
  end

  describe 'user#show page' do
    before(:each) { visit user_path(@user) }

    it "\nshould the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "\nshould have username link" do
      expect(page).to have_link(@user.name, href: user_path(id: @user.id))
    end

    it "\n  The number of posts should be equal to 20" do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it "The number of comments for this post should be equal to 100" do
      expect(page).to have_content(@post.comments_counter)
    end

    it " The number of likes should be equal to 10000" do
      expect(page).to have_content(@post.likes_counter)
    end

    it "\n  should redirect to the post show page on clicking a user post" do
      click_link(@post.title)
      expect(page).to have_current_path(post_show_path(@user, @post))
    end

    it "\n  should redirect to open all posts of a user" do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
