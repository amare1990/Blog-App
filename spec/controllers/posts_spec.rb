RSpec.describe PostsController, type: :request do
  describe 'get /users/id/posts' do

    it "The server with /users/id/posts/ request should respond status number 200" do
      get user_posts_path
      expect(response).to have_http_status(200)
    end

    it "The server with /users/id/posts/id/ request should respond status number 200" do
      get user_post_path
      expect(response).to have_http_status(200)
    end

  end
end
