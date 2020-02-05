# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:given_avaliations) }
    it { is_expected.to have_many(:received_avaliations) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:role) }
    end

    context 'length' do
      it { is_expected.to validate_length_of(:name).is_at_most(200) }
      it { is_expected.to validate_length_of(:email).is_at_most(100) }
    end
  end

  describe 'create' do
    let(:valid_user) { FactoryBot.build(:user, :administrator) }
    let(:invalid_user) { FactoryBot.build(:user, email: '') }

    it 'is valid with valid attributes' do
      expect(valid_user).to be_valid
    end

    it 'is not valid' do
      expect(invalid_user).to_not be_valid
    end
  end
end
