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

  describe 'has departure airport' do
    it { is_expected.to belong_to(:departure_airport) }
  end

  describe 'has arrival airport' do
    it { is_expected.to belong_to(:arrival_airport) }
  end

  describe 'has find_by_params' do
    it 'is expected to find flights by given params' do
      flight =  create(:flight)

      params = { departure_airport: flight.departure_airport.id,
                 arrival_airport: flight.arrival_airport.id,
                 start_time: flight.start_time.to_date }

      expect(described_class.find_by_params(params).first).to eq(flight)
    end
  end
end
