require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create(:account) }
  let(:invalid_account) { build(:account, name: nil) }

  describe 'associations' do
    it { expect(account.users).to be_empty }
    it { expect(account.ads).to be_empty }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(account).to be_valid
    end

    it 'is invalid without a name' do
      expect(invalid_account).not_to be_valid
      expect(invalid_account.errors[:name]).to include("can't be blank")
    end
  end
end
