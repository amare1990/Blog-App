require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'get /users' do
    it "\n should respond a status number 200" do
      get users_path
      expect(response).to have_http_status(200)
    end

    it "\n should render the user/index.html.erb template" do
      get users_path
      expect(response).to render_template('users/index')
    end

    it "\n should not render the user/show.html.erb template" do
      get users_path
      expect(response).not_to render_template('users/show')
    end

    it "\nshould return the correct placeholder text" do
      get users_path
      expect(response.body).to include('Here is list of users and their corresponding number of posts')
    end

    it "\nshould not return a text other than the correct placeholder text" do
      get users_path
      expect(response.body).not_to eq('ere is list of users and their corresponding number of posts')
    end
  end

  describe 'get /users/id' do
    it "\nshould respond success status message" do
      get '/users/id/', params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it "\nshould not respond 401 ('Not Found') status message" do
      get user_path(:id)
      expect(response).not_to have_http_status(404)
    end

    it "\nshould render the correct template(users/show)" do
      get user_path(:id)
      expect(response).to render_template('users/show')
    end

    it "\nshould not render a template other than the correct template(users/show)" do
      get user_path(:id)
      expect(response).not_to render_template('users/index')
    end

    it "\nshould respond the correct placeholder text" do
      get user_path(:id)
      placeholder_text = 'Here is an author with her/his corresponding bio and his/her posts'
      expect(response.body).to include(placeholder_text)
    end

    it "\nshould not respond a placeholder text other than the correct placeholder text" do
      get user_path(:id)
      placeholder_text = 'is an author with her/his corresponding bio and his/her posts'
      expect(response.body).not_to eq(placeholder_text)
    end
  end
end
