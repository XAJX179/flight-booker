require 'rails_helper'

RSpec.describe Flight, type: :model do
  subject(:flight) { build(:flight) }

  describe 'has start_time' do
    it { is_expected.to have_db_column(:start_time).of_type(:datetime) }
  end

  describe 'has duration' do
    it { is_expected.to have_db_column(:duration).of_type(:string) }
  end

  describe 'has departure_airport_id' do
    it { is_expected.to have_db_column(:departure_airport_id).of_type(:integer) }
  end

  describe 'has arrival_airport_id' do
    it { is_expected.to have_db_column(:arrival_airport_id).of_type(:integer) }
  end

  describe 'is valid' do
    it { is_expected.to be_valid }
  end

  # TODO: write association tests
end
