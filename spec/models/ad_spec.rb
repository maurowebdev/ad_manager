require 'rails_helper'
ActiveJob::Base.queue_adapter = :test

RSpec.describe Ad, type: :model do
  describe 'validations' do
    let(:valid_ad) { create(:ad) }
    let(:invalid_ad) { build(:ad, title: nil, description: nil, images: nil, account: nil) }
    it 'is valid with valid attributes' do
      expect(valid_ad).to be_valid
    end

    it 'is invalid without a title' do
      expect(invalid_ad).to be_invalid
      expect(invalid_ad.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      expect(invalid_ad).to be_invalid
      expect(invalid_ad.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a account' do
      expect(invalid_ad).to be_invalid
      expect(invalid_ad.errors[:account]).to include("must exist")
    end
  end
end
