# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Avaliation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:evaluated) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:organization) }
      it { is_expected.to validate_presence_of(:responsibility) }
      it { is_expected.to validate_presence_of(:proactivity) }
      it { is_expected.to validate_presence_of(:team_work) }
      it { is_expected.to validate_presence_of(:creativity) }
      it { is_expected.to validate_presence_of(:focus) }
    end
  end

  describe 'create' do
    let(:valid_avaliation) { FactoryBot.build(:avaliation) }
    let(:invalid_avaliation) { FactoryBot.build(:avaliation, organization: nil) }

    it 'is valid with valid attributes' do
      expect(valid_avaliation).to be_valid
    end

    it 'is not valid' do
      expect(invalid_avaliation).to_not be_valid
    end
  end
end
