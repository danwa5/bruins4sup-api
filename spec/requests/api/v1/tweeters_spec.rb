require 'rails_helper'

RSpec.describe 'Api/V1/Tweeters', type: :request do
  let(:user) { create(:user) }
  let!(:tweeter1) { create(:tweeter) }
  let!(:tweeter2) { create(:tweeter) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'GET /api/v1/tweeters' do
    it 'responds with all tweeters' do
      get '/api/v1/tweeters'
      json = JSON.parse(response.body)

      aggregate_failures 'json response' do
        expect(response).to be_success
        expect(json['data'].count).to eq(2)
      end
    end
  end

  describe 'GET /api/v1/tweeters/:id' do
    context 'when :id is found' do
      it 'responds with the correct tweeter' do
        get "/api/v1/tweeters/#{tweeter2.screen_name}"
        json = JSON.parse(response.body)

        aggregate_failures 'json response' do
          expect(response).to be_success
          expect(json['data']['id']).to eq(tweeter2.id.to_s)
        end
      end
    end

    context 'when :id is not found' do
      it 'responds with 404 Not Found' do
        get '/api/v1/tweeters/foo'
        json = JSON.parse(response.body)
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /api/v1/tweeters' do
    let(:params) do
      {
        tweeter: {
          uid: 'UID',
          screen_name: 'SCREENNAME',
          name: 'NAME',
        }
      }
    end

    it 'creates a new object and responds with 201 Created' do
      expect {
        post '/api/v1/tweeters', params: params
      }.to change(Tweeter, :count).by(1)
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
    end

    context 'when request fails' do
      before do
        create(:tweeter, uid: 'UID')
      end
      it 'does not create a new object and responds with 403 Forbidden' do
        expect {
          post '/api/v1/tweeters', params: params
        }.not_to change(Tweeter, :count)
        json = JSON.parse(response.body)
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
