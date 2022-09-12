require 'swagger_helper'

RSpec.describe 'Registration API' do
  path '/api/users' do
    post 'Creates user with a token' do
      tags 'Signup / Register'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: %w[username email password]
      }
      response '200', 'user created with token' do
        let(:sign_up) { { username: 'Solomon', email: 'test@test.com', password: '123456' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:sign_up) { '' }
        run_test!
      end
    end
  end
  path '/api/users/sign_in' do
    post 'Creates a user with a token' do
      tags 'Signin / Login'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: %w[email password]
      }
      response '200', 'user signed in with token' do
        let(:sign_in) { { username: 'Solomon', email: 'test@test.com', password: '123456' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:sign_in) { '' }
        run_test!
      end
    end
  end
end
