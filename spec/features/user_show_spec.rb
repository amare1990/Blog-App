require 'rails_helper'

RSpec.describe 'Single User Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Amare', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Microverse student',
                        posts_counter: 20)
    @post = Post.create(title: 'rails Integ testing', text: 'This is my first integration testing',
                        comments_counter: 100, likes_counter: 10_000, author: @user)
    @post2 = Post.create(title: 'Backednd devt', text: 'Rails seems challenging',
                         comments_counter: 10, likes_counter: 10, author: @user)
    @post3 = Post.create(title: 'rails based on automagically', text: 'Naming conventions sometimes creates bugs',
                         comments_counter: 2000, likes_counter: 100, author: @user)
    @post4 = Post.create(title: 'Which Framework', text: 'Django seems easier',
                         comments_counter: 400, likes_counter: 100, author: @user)
  end

  describe 'user#show page' do
    before(:each) { visit user_path(@user) }

    it "\n should display user's profile picture" do
      expect(page).to have_css('img[src*="https://unsplash.com/photos/F_-0BxGuVvo"]')
    end

    it "\nshould display the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "\nshould not have other name" do
      expect(page).not_to have_content('Pepe')
    end

    it "\nshould have username link" do
      expect(page).to have_link(@user.name, href: user_path(id: @user.id))
    end

    it "\n  The number of posts should be equal to 20" do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it 'The number of comments for this post should be equal to 100' do
      expect(page).to have_content(@post.comments_counter)
    end

    it ' The number of likes should be equal to 100' do
      expect(page).to have_content("Likes: #{@post4.likes_counter}")
    end

    it ' should display the author bio' do
      expect(page).to have_content('Microverse student')
    end

    it ' should not display the fourth post for this route' do
      expect(page).to have_content('Which Framework')
    end

    it "\n  should redirect to the post show page on clicking a user post" do
      click_link(@post4.title)
      expect(page).to have_current_path(post_show_path(@user, @post4))
    end

    it "\n  should not redirect to the post of another id show page on clicking a user post" do
      click_link(@post4.title)
      expect(page).to_not have_current_path(post_show_path(@user, @post))
    end

    it "\n  should redirect to open all posts of a user" do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
