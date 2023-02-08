require 'rails_helper'

RSpec.describe 'post#index', type: :feature do
  describe 'post page' do
    before(:each) do
      @user = User.create!(name: 'Amare23', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Microverse student22')
      @post = Post.create!(title: 'Integ test22', text: 'differs much in using matchers...', author_id: @user.id)
      @comment = Comment.create!(text: 'I need help!', author: @user, post: @post)
      Like.create!(author_id: @user.id, post_id: @post.id)

      visit(user_posts_path(@user))
    end

    it " should display users' username" do
      expect(page).to have_content('Amare')
    end

    it "\n should display user's profile picture" do
      expect(page).to have_css('img[src*="https://unsplash.com/photos/F_-0BxGuVvo"]')
    end

    it 'should display the number of posts for the user to be 1' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'should not display the number of posts for the user to be 2' do
      expect(page).to_not have_content('Number of posts: 2')
    end

    it "\nshould display posts author name" do
      expect(page).to have_content(@post.author.name)
    end

    it "\nshould display posts title" do
      expect(page).to have_content(@post.title)
    end

    it "\nshould display the body of the post text" do
      expect(page).to have_content 'differs much in using'
    end

    it "\nshould display the comment on this post" do
      expect(page).to have_content('I need help!')
    end

    it "\nshould display the comments counter for the post to be 1" do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it "\nshould display the likes counter for the post to be 1" do
      expect(page).to have_content('Likes: 1')
    end

    it "\nI can see a section for pagination if there are more posts than fit on the view." do
      expect(page).to have_content('Pagination')
    end

    it "\nshould display post details when the user clicks title of the post link" do
      click_link 'Integ test22'
      expect(page).to have_current_path post_show_path(@post.author_id, @post)
    end
  end
end
