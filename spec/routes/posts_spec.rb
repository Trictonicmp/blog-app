require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/id/posts' do
    before do
      get user_posts_path(user_id: 20)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include("Here is the user")
    end

    it 'renders the correct page' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/id/posts/id' do
    before do
      get user_post_path(user_id: 20, id: 5)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include('here is the user')
    end

    it 'renders the correct page' do
      expect(response).to render_template(:show)
    end
  end
end