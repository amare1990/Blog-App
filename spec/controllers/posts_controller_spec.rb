require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'get /users/id/posts' do
    it 'The server with /users/id/posts/ request should respond status number 200' do
      get '/users/:id/posts', params: { id: 1 }
      expect(response).to have_http_status(200)
    end

    it 'The server with /users/id/posts/id/ request should respond status number 200' do
      get '/users/:id/posts/commen', params: { id: 1 }
      expect(response).to have_http_status(200)
    end

    it 'The server with /users/id/posts/id/ request should render the posts/index.html.erb' do
      get '/users/:id/posts', params: { id: 1 }
      expect(response).to render_template('posts/index')
    end

    it 'The server with /users/id/posts/id/ request should not render template other than the posts/index.html.erb' do
      get '/users/:id/posts', params: { id: 1 }
      expect(response).not_to render_template('posts/show')
    end

    it 'The server with /users/id/posts/id/ request should return the right placeholder text' do
      get '/users/:id/posts', params: { id: 1 }
      placeholder_text = 'Here is list of posts for an author with author_id = id'
      expect(response.body).to include(placeholder_text)
    end

    it 'The server with /users/id/posts/id/ request should not return the placeholder text modified' do
      get '/users/:id/posts', params: { id: 1 }
      placeholder_text = 'ere is list of posts for an author with author_id = id'
      expect(response.body).not_to eq(placeholder_text)
    end
  end

  describe 'users/id/posts/id' do
    it 'should respond with HTTP status 200' do
      get '/users/:author_id/posts/:post_id', params: { author_id: 1, post_id: 1 }
      expect(response).to have_http_status(200)
    end

    it 'should render the /posts/show.html.erb template' do
      get '/users/:author_id/posts/:post_id', params: { author_id: 1, post_id: 1 }
      expect(response).to render_template('posts/show')
    end

    it 'should not render a template other than the /posts/show.html.erb template' do
      get '/users/:author_id/posts/:post_id', params: { author_id: 1, post_id: 1 }
      expect(response).not_to render_template('users/show')
    end

    it 'should respond with the right placeholder text' do
      get '/users/:author_id/posts/:post_id', params: { author_id: 1, post_id: 1 }
      placeholder_text = 'This shows the details of a post with id = post_id and written by an author'
      expect(response.body).to include(placeholder_text)
    end

    it 'should not respond a placeholder text other than the correct one' do
      get '/users/:author_id/posts/:post_id', params: { author_id: 1, post_id: 1 }
      placeholder_text = 'This shows the details'
      expect(response.body).not_to eq(placeholder_text)
    end
  end
end
