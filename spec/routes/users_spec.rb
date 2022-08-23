require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    before do
      user = User.new(name: 'Amaury', bio: 'Web-dev', photo: 'google.com')
      user.save
      get users_path(id: 1)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include("Amaury")
    end

    it 'renders the correct page (index)' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    before do
      user = User.new(name: 'Amaury', bio: 'Web-dev', photo: 'google.com')
      user.save

      get user_path(id: user.id)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include('Web-dev')
    end

    it 'renders the correct page (show)' do
      expect(response.body).to render_template(:show)
    end
  end
end
