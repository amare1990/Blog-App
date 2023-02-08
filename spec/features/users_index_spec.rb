require 'rails_helper'

RSpec.describe 'users#index route Page testing', type: :feature do
  before(:each) do
    @user = User.create(name: 'Amare orig 2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Microvers estudent', posts_counter: 20)
    @user2 = User.create(name: 'Hanna', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Microvers estudent sec batch', posts_counter: 56)
  end

  describe "\nusers#index testing group" do
    before(:each) { visit users_path }

    it 'should display the username of each user' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it "\n should display user's profile picture" do
      expect(page).to have_css('img[src*="https://unsplash.com/photos/F_-0BxGuVvo"]')
    end

    it 'should not display bio text unrelated' do
      expect(page).to_not have_content('zzzzxxx')
    end

    it 'should display the number of posts of each user' do
      User.all.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end

    it "\n should redirect to that user when the username link is clicked" do
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
