require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/id/posts' do
    before do
      user = User.new(name: 'Amaury', bio: 'Web-dev', photo: 'google.com')
      user.save
      post = Post.new(author: user, title: 'hello', text: 'post no1')
      post.save
      get user_posts_path(user_id: user.id)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include('Amaury')
    end

    it 'renders the correct page' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/id/posts/id' do
    before do
      user = User.new(name: 'Amaury', bio: 'Web-dev', photo: 'google.com')
      user.save
      post = Post.new(author: user, title: 'hello', text: 'post no1')
      post.save

      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include('hello')
    end

    it 'renders the correct page' do
      expect(response).to render_template(:show)
    end
  end
end
