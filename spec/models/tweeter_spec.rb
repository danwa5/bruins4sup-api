require 'rails_helper'

RSpec.describe Tweeter, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:screen_name) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:screen_name) }
    it { is_expected.to validate_uniqueness_of(:uid) }
  end
end
