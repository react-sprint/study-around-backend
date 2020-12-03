require 'swagger_helper'

describe 'Study-around API' do
  path '/users' do
    post 'create a user' do
      tags 'User'
      consumes 'application/json'

      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '201', 'user is created' do
        # let(:user) { { email: 'foo', password: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        # let(:user) { { message: 'invalid request' } }
        run_test!
      end
    end
  end

  path '/auth_user' do

    post 'check a user' do
      tags 'User'
      consumes 'application/json'
      
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          auth: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: [ 'email', 'password' ]
      }

      response '201', 'user is vaild' do
        let(:user) { { email: 'foo', password: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { message: 'invalid request' } }
        run_test!
      end
    end
  end

end