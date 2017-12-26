require 'rails_helper'

RSpec.describe 'Api/V1/Twitter/Users', type: :request do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'GET /api/v1/twitter/users/:id' do
    context 'when screen name is found' do
      it 'returns 200 ok' do
        allow_any_instance_of(User).to receive_message_chain(:twitter, :user, :attrs)

        get '/api/v1/twitter/users/uclafootball'
        expect(response).to have_http_status(200)
      end
    end
    context 'when screen name is not found' do
      it 'returns 404 not found' do
        allow_any_instance_of(User).to receive_message_chain(:twitter, :user, :attrs).and_raise

        get '/api/v1/twitter/users/uclafootball'
        expect(response).to have_http_status(404)
      end
    end
  end
end
