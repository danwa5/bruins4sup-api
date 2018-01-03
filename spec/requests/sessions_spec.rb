require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /auth/twitter/callback' do
    it 'returns the authenticated user' do
      user = create(:user)
      allow(User).to receive(:find_or_create_from_auth_hash).and_return(user)
      expect(User).to receive(:find_or_create_from_auth_hash).once

      get '/auth/:provider/callback'
      json = JSON.parse(response.body)

      expect(response).to be_success
      aggregate_failures 'response json' do
        expect(json['id']).to eq(user.id)
        expect(json['uid']).to eq(user.uid)
        expect(json['name']).to eq(user.name)
        expect(json['token']).to eq(user.token)
        expect(json['secret']).to eq(user.secret)
      end
    end
  end
end
