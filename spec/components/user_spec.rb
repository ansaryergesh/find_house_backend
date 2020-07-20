require 'rails_helper'

RSpec.describe 'User API', type: :request do
  # initialize test data
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { { user: { username: Faker::Name.name, bio: 'Bio Hello', password: 'password' } } }
  let(:headers) { valid_headers }
  
  # Test suite for POST /users
  describe 'POST /api/v1/users' do
    context 'when the request is valid' do
      before { post '/api/v1/users', params: valid_attributes }
      it 'creates a user' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/users', params: { user: { username: '', bio: 'Bio Hello', password: 'password' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match({ 'name' => ["can't be blank"] })
      end
    end
  end

  describe 'get /api/v1/profile' do
    before { get '/api/v1/profile', headers: headers }
    context 'When user has been authenticated' do
      it 'Retuns the current user' do
        expect(json['username']).to eq(user.username)
      end
      it 'Returns a status of 200' do
        expect(response).to have_http_status(200)
      end
    end

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