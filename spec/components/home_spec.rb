require 'rails_helper'

RSpec.describe 'User API', type: :request do
  let(:headers) { valid_headers }
  let(:user) { FactoryBot.create(:user) }
  describe 'Get Homes' do
    before { get '/api/v1/homes', headers: headers }
    it 'returns status code 200 all home list' do
        expect(response).to have_http_status(200)
    end
  end
end