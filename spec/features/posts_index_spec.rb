require 'rails_helper'

RSpec.describe 'post#index', type: :feature do
  describe 'post page' do
    before(:each) do
      @user = User.create!( name: 'Amare23', photo: 'my-photo2', bio: 'Microverse student22' )
      @post = Post.create!(title: 'Integ test22', text: 'differs much in using matchers...', author_id: @user.id)
      @comment = Comment.create!(text: 'I need help!', author_id: @user.id, post_id: @post.id)
      Like.create!(author_id: @user.id, post_id: @post.id)

      visit(user_posts_path(@user))
    end

    it " should display users' username" do
      expect(page).to have_content('Amare')
    end

    it 'should display the number of posts for the user to be 1' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'should display posts author name' do
      expect(page).to have_content(@post.author.name)
    end

    it 'should display posts title' do
      expect(page).to have_content(@post.title)
    end

    it 'should display the body of the post text' do
      expect(page).to have_content 'differs much in using matchers'
    end

    it 'should display the comment on this post' do
      expect(page).to have_content ("I need help!")
    end

    it 'should display the comments counter for the post to be 1' do
      expect(page).to have_content(1)
    end

    it  "should display the likes counter for the post to be 1" do
      expect(page).to have_content(1)
    end

    # it "should display post details when the user clicks title of the post link" do
    #   click_link(user_posts_path(@post.title))
    #   expect(page).to have_current_path post_show_path(@post.author_id, @post)
    # end
  end
end
