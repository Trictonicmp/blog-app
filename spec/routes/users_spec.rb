require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    before do
      get users_path(id: 20)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include("Here's a list of users")
    end

    it 'renders the correct page (index)' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    before do
      get user_path(id: 20)
    end

    it 'returns an (OK) HTTP status' do
      expect(response).to have_http_status(:ok)
    end

    it 'should have text' do
      expect(response.body).to include('Here is the user 20')
    end

    it 'renders the correct page (show)' do
      expect(response.body).to render_template(:show)
    end
  end
end
