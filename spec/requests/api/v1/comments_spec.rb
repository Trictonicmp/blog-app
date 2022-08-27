require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
    parameter name: 'Authorization', in: :header, type: :string, description: 'token'

    get('list comments') do
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:post_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create comment') do
      parameter name: :comment, in: :body, required: true, schema: {
        type: :object,
        properties: {
          comment: {
            type: :object,
            properties: {
              text: { type: :string },
              post_id: { type: :integer },
              author_id: { type: :integer }
            },
            required: %w[text post_id author_id]
          }
        }
      }
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:post_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:comment) { { comment: { text: 'Hellooo', user_id: 1, post_id: 10 } } }
        run_test!
      end
    end
  end
end
