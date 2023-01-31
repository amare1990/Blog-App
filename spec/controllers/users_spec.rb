require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'get /users' do
    it "The server with /users/ request should respond a status number 200" do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'The server with /users url request should render the user/index.html.erb template' do
      get users_path
      expect(response).to render_template('users/index')
    end

    it 'The server with /users url request should not render the user/show.html.erb template' do
      get users_path
      expect(response).not_to render_template('users/show')
    end

    it 'the response body should include the correct placeholder text' do
      get users_path
      expect(response.body).to include('Here is list of users and their corresponding number of posts')
    end

  end # end of 'get /users/' describe block

  describe 'get /users/id' do

    it "The server with /users/id/ url request should respond success status message" do
      get '/users/id/', params: {id: 1}
      expect(response).to have_http_status(:success)
    end

    it "The server with /users/id/ request should respond status number 200" do
      get user_path(:id)
      expect(response).to have_http_status(200)
    end

    it "The server with /users/id/ url request should not respond 401 ('Not Found') status message" do
      get user_path(:id)
      expect(response).not_to have_http_status(404)
    end

    it "The server with /users/id/ request should respond status number 200" do
      get user_path(:id)
      expect(response).to have_http_status(200)
    end
  end # end of '/users/id' describe block

end
