require 'swagger_helper'

describe 'Study-around API project' do
  path '/project/create' do
    post 'create a project' do
      tags 'Project'
      consumes 'application/json'
      
      parameter name: 'Authorization', :in => :header, :type => :string
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          project: {
            type: :object,
            properties: { 
              name: { type: :string },
              introduce: { type: :string },
              manager_introduce: { type: :string },
              manager: { type: :integer },
              wday: { type: :string },
              start_hour: { type: :integer },
              start_minute: { type: :integer },
              end_hour: { type: :integer },
              end_minute: { type: :integer },
            } 
          }
        }
        # required: [ 'project', 'password' ]
      } # properties end
    
      response '201', 'project is created' do
        # let(:"Authorization") { "Bearer #{token_for(user)}" }
        # let(:project) { build(:project) }
        run_test!
      end
      
      response '422', 'invalid request' do
        # let(:user) { { message: 'invalid request' } }
        run_test!
      end
    end
  end
end