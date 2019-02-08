require 'swagger_helper'
require 'rails_helper'

describe 'Users API' do

  path '/api/users/{id}' do

    get 'Retrieves a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object, properties: {
          id: { type: :integer }
        }, required: ['id']

        let(:id) { User.create.id }
        run_test!
      end
    end
  end

  path '/api/users/search' do
    before(:each) do
      load "#{Rails.root}/db/seeds.rb"
    end

    post 'Find friends' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :search, in: :body, schema: {
        type: :object,
        properties: {
          radius: { type: :string },
          lat: { type: :string },
          lng: { type: :string }
        },
        required: %w[radius lat lng]
      }

      response '201', 'users has been found' do
        let(:search) { { radius: '5', lat: '55.75', lng: '37.6167' } }
        run_test!
      end
    end
  end
end
