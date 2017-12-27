require 'rails_helper'

RSpec.describe 'api/v1/twitter/users/:user_id/tweets', type: :request do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'GET /api/v1/twitter/users/:user_id/tweets' do
    context 'when fetching user timeline is successful' do
      it 'returns 200 ok' do
        tweeter = create(:tweeter, uid: '123', screen_name: 'uclafootball')
        allow(user).to receive_message_chain(:twitter, :user_timeline)
        get "/api/v1/twitter/users/#{tweeter.uid}/tweets"
        expect(response).to have_http_status(200)
      end
    end
    context 'when fetching user timeline raises an exception' do
      it 'returns 404 not found' do
        tweeter = create(:tweeter, uid: '123', screen_name: 'uclafootball')
        allow(user).to receive_message_chain(:twitter, :user_timeline).and_raise
        get "/api/v1/twitter/users/#{tweeter.uid}/tweets"
        expect(response).to have_http_status(404)
      end
    end
    context 'when twitter user user_id is not found' do
      it 'returns 404 not found' do
        get "/api/v1/twitter/users/foo/tweets"
        expect(response).to have_http_status(404)
      end
    end
  end
end
