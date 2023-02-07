require 'rails_helper'

RSpec.describe 'users#index route Page testing', type: :feature do
  before(:all) do
    @user = User.create(name: 'Amare original', photo: 'my-phto',bio: 'Microvers estudent', posts_counter: 20)
  end

  describe "\nusers#index testing group" do
    before(:each) { visit users_path }

    it 'should display the username of each user' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
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
