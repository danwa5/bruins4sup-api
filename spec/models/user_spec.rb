require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_or_create_from_auth_hash' do
    it 'creates an user and sets its attributes' do
      hash = {
        provider: 'PROVIDER',
        uid: 'UID',
        info: {
          name: 'NAME',
          image: 'IMAGE'
        },
        credentials: {
          token: 'TOKEN',
          secret: 'SECRET'
        }
      }

      json = hash.to_json
      struct = JSON.parse(json, object_class: OpenStruct)

      expect {
        described_class.find_or_create_from_auth_hash(struct)
      }.to change(User, :count).by(1)

      user = User.last

      aggregate_failures 'user attributes' do
        expect(user.provider).to eq('PROVIDER')
        expect(user.uid).to eq('UID')
        expect(user.name).to eq('NAME')
        expect(user.profile_image).to eq('IMAGE')
        expect(user.token).to eq('TOKEN')
        expect(user.secret).to eq('SECRET')
      end
    end
  end

  describe '#twitter' do
    example do
      expect(Twitter::REST::Client).to receive(:new).once
      subject.twitter
    end
  end
end
