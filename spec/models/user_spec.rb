require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:invalid_user) { build(:user, first_name: nil, last_name: nil, email: nil) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is invalid without an email' do
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a first name' do
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:first_name]).to include("can't be blank")
    end

    it 'is invalid without a last name' do
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:last_name]).to include("can't be blank")
    end

    it 'is valid without an account' do
      expect(user).to be_valid
    end
  end
end
