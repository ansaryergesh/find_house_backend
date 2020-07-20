# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User API', type: :request do
  # initialize test data
  let(:headers) { valid_headers }
  let(:user) { FactoryBot.create(:user) }
  let(:user_id) { user.id }
  let(:valid_attributes) { { username: 'testuser', password: 'password', bio: 'Biography' } }

  # Test suite for POST /users
  describe 'POST /api/v1/users' do
    context 'when the request is valid' do
      before { post '/api/v1/users', params: valid_attributes }
      it 'creates a user' do
        expect(json['jwt']).not_to be_nil
      end

      it 'returns status code 201 created status' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when the request is invalid' do
      before { post '/api/v1/users', params: { username: '', bio: 'Bio Hello', password: 'password' } }

      it 'Returns an error message' do
        expect(json['message'])
          .to eq(["Username can't be blank"])
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'get /api/v1/profile' do
    before { get '/api/v1/profile', headers: headers }

    context 'When user has not been authenticated' do
      let(:headers) { invalid_headers }
      it 'Returns an error message' do
        expect(json['message']).to eq('Please log in')
      end

      it 'Returns a status of 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
